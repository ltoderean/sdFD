namespace: fgfg_17nov26
flow:
  name: dfsd_17nov26
  workflow:
    - Generate_Random_Number:
        do_external:
          06fe8531-868b-4e79-aa7a-13a5e30a66ec:
            - min: "${get_sp('SysProp1_min17nov26')}"
            - max: "${get_sp('SysProp1_max17nov26')}"
        publish:
          - output_0: output_0
          - output_1: output_1
          - output_2: output_2
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
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Generate_Random_Number:
        x: 100
        'y': 250
        navigate:
          c517d493-a14c-9d8f-8869-5cd0d590cf82:
            targetId: a01f7a0b-7a4e-8fd2-c375-599d87c9aaaa
            port: failure
      generate_random_number_1:
        x: 400
        'y': 250
        navigate:
          c6d2f551-a96d-b96f-c917-55cb8fe907a2:
            targetId: a01f7a0b-7a4e-8fd2-c375-599d87c9aaaa
            port: FAILURE
          c959bc22-55d6-4b7a-4d0d-82bde8a05cf7:
            targetId: 1de81a0d-15c9-b71d-3c99-3d2a1ae4bfbe
            port: SUCCESS
    results:
      FAILURE:
        a01f7a0b-7a4e-8fd2-c375-599d87c9aaaa:
          x: 700
          'y': 125
      SUCCESS:
        1de81a0d-15c9-b71d-3c99-3d2a1ae4bfbe:
          x: 700
          'y': 375
