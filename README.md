# 5x5-Fabric-for-4-different-DFGs
Design Overview:
This project implements a 5x5 reconfigurable fabric designed to support four different Data Flow Graphs (DFGs), each with varying numbers of rows and columns. The fabric accommodates up to 5 rows and 5 columns, with homogeneous Computational Units (CUs) across rows. Each CU supports 21 different operations and handles 4-bit input and output data. The CUs are interconnected via a heterogeneous interconnect system, optimized for flexibility and performance.

Computational Units (CUs):
Each CU in the architecture is designed to handle two inputs and one output, with support for Pass and NOOP operations.
The CUs are homogeneous, meaning all units in a row perform the same function but can be reconfigured for different operations.
The design utilizes a 32x1 multiplexer (MUX) within each CU to implement various arithmetic and logic functions, including addition, multiplication, shift, and comparison operations.
The outputs of the CU operations are truncated to 4 bits (3 downto 0), and shift operations handle the last two bits for shifting operations (0-3 bits).
Interconnects:
The interconnect system is designed to connect the rows and columns, allowing data to flow efficiently through the fabric. There are four types of interconnects in the architecture, each tailored to meet the specific requirements of the four different DFGs:

Mirrored Multiplexers: All multiplexers used in the interconnects are mirrored pairs, improving connectivity and flexibility. For example, a mirrored 2x1 MUX enables reachability from -1 to +1, while a mirrored 4x1 MUX provides different types of reachability, including vertical connectivity.

2x1 MUX (Mirrored Pair): Provides connectivity from -1 to +1, enabling connections from the previous row’s CU elements.
4x1 MUX (Type 1): Provides connectivity from -2 to +2, used for standard horizontal reachability.
4x1 MUX (Type 2): Offers vertical connectivity, connecting the current row’s CUs to the row immediately above.
Arithmetic Operations:
Addition and Multiplication: Outputs are truncated to the last 4 bits (3 downto 0).
Shift Operations: The shift operation considers the last two bits of the input for shifting by 0-3 positions.
Comparison Operations:
Less Than ('<'): Outputs the smaller of the two inputs.
Greater Than ('>'): Outputs the larger of the two inputs.
Equal To ('='): Outputs “1111” if both inputs are equal, and “0000” if they are different.
Interconnect Details:
InterConnect 1: Connects Row 1 and Row 2, featuring a mix of 2x1 and 4x1 mirrored multiplexers (Type 1).
InterConnect 2: Connects Row 2 and Row 3, utilizing 2x1 and 4x1 multiplexers (Type 2), with vertical reachability to Row 1.
InterConnect 3: Connects Row 3 and Row 4, using a mix of mirrored 2x1 and 4x1 multiplexers (both Types 1 and 2).
InterConnect 4: Connects Row 4 and Row 5, utilizing only 2x1 mirrored multiplexers for connectivity.
Key Features:
Enable Signals: All CUs and multiplexers have an enable signal, allowing unused units to be disabled, optimizing resource usage.
Mirrored MUX Pairs: Provides higher reachability and efficient connectivity, minimizing the need for larger multiplexers.
Conclusion:
This reconfigurable 5x5 fabric can efficiently handle four different DFGs with varying connectivity needs. The use of homogeneous CUs, heterogeneous interconnects, and mirrored multiplexers allows for high flexibility, performance, and adaptability across different computational tasks. The architecture ensures optimal resource utilization while maintaining the system’s versatility.
