# divide_and_conquer_32x32
 Divide and conquer :- Divide the 32 x 32 multiplication operation into smaller sub-tasks. For example, you can divide it into four 16 x 16 multiplications or sixteen 8 x 8 multiplications.

 ### RTL Description: 32x32 Multiplier using Divide-and-Conquer Approach

- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: June 13, 2023
- **Module Name**: top
- **Company**: College of VLSI
- **Revision**: Revision 0.01 - File Created

#### Overview:
The `top` module implements a 32x32 multiplier using a divide-and-conquer approach. It decomposes the multiplication operation into smaller 16x16 multiplications to reduce complexity.

#### Functional Description:
- **Inputs**: 
  - `clk_in1_n`: Negative phase clock input.
  - `clk_in1_p`: Positive phase clock input.
- **Outputs**:
  - `result`: Result of the 32x32 multiplication operation.
- **Internal Components**:
  - Four instances of `multiplier_16x16` module are instantiated to perform 16x16 multiplications.
  - `clk_wiz_0`: Clock Wizard IP core for clock generation.
  - `via_0`: Virtual Input/Output (VIO) core for debugging purposes.
- **Registers**:
  - `a_upper`, `a_lower`, `b_upper`, `b_lower`: Registers to store upper and lower halves of operand A and operand B.
  - `result`: Register to store the final result of the multiplication.
- **Logic**:
  - The 32-bit operands `operand_a` and `operand_b` are split into upper and lower halves.
  - Four 16x16 multiplications are performed in parallel.
  - The results from the 16x16 multiplications are padded and added to obtain the final 64-bit result.
- **Dependencies**:
  - This module has dependencies on the `multiplier_16x16` module and clock generation IP core (`clk_wiz_0`).
- **Additional Comments**:
  - The divide-and-conquer approach reduces the complexity of the 32x32 multiplication operation by breaking it down into smaller multiplications.
  - The clock wizard IP core generates the required clock signals for proper operation.
  - The VIO core allows for debugging and monitoring internal signals during simulation or synthesis.
