namespace: fgfg_17nov26
flow:
  name: fgfg_17nov26
  workflow:
    - Generate_Random_Number:
        do_external:
          06fe8531-868b-4e79-aa7a-13a5e30a66ec:
            - min: "${get_sp('SysProp1_min17nov26')}"
            - max: "${get_sp('SysProp1_max17nov26')}"
        publish:
          - output_0: output_0
          - output_1: output_1
        navigate:
          - success: generate_random_number_1
          - failure: FAILURE
    - generate_random_number_1:
        do:
          io.cloudslang.base.samples.math.generate_random_number:
            - min: "${get_sp('SysProp1_min17nov26')}"
            - max: "${get_sp('SysProp1_max17nov26')}"
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: python2
    - python2:
        do:
          performance.python2: []
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: fgfg_17nov26_py
    - fgfg_17nov26_py:
        do:
          fgfg_17nov26.fgfg_17nov26_py: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Generate_Random_Number:
        x: 40
        'y': 80
        navigate:
          2a8c8f9d-67ab-035c-6d9d-a84f5ed60a1f:
            targetId: e380ded7-54ec-36e8-9fad-31ef3ff4c1f9
            port: failure
      generate_random_number_1:
        x: 240
        'y': 80
        navigate:
          b1964526-b82f-86ad-30d7-dff9dd0fab79:
            targetId: e380ded7-54ec-36e8-9fad-31ef3ff4c1f9
            port: FAILURE
      fgfg_17nov26_py:
        x: 760
        'y': 80
        navigate:
          9af889ce-3e53-6fe1-9b54-1e5af7595a8b:
            targetId: a9ad8a72-ab59-896c-d8fc-fe12d5b5cc11
            port: SUCCESS
      python2:
        x: 600
        'y': 80
        navigate:
          2ecc7a85-f5a0-b42d-6161-f8e694bb0be5:
            targetId: e380ded7-54ec-36e8-9fad-31ef3ff4c1f9
            port: FAILURE
    results:
      FAILURE:
        e380ded7-54ec-36e8-9fad-31ef3ff4c1f9:
          x: 480
          'y': 320
      SUCCESS:
        a9ad8a72-ab59-896c-d8fc-fe12d5b5cc11:
          x: 840
          'y': 280
