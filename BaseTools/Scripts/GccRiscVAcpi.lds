/** @file

  Linker script for GCC based RISC-V ACPI table builds.

  This script is used instead of the default linker script to avoid
  the "PHDR segment not covered by LOAD segment" error with binutils 2.39+,
  which occurs when the ELF program header table is not within any LOAD
  segment's address range.

  Copyright (c) 2010 - 2021, Intel Corporation. All rights reserved.<BR>
  Copyright (c) 2015, Linaro Ltd. All rights reserved.<BR>

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

SECTIONS {
  . = 0;
  .data : {
    KEEP(*(.entry))
    *(.text .text.*)
    *(.rodata .rodata.*)
    *(.srodata .srodata.*)
    *(.data .data.*)
    *(.sdata .sdata.*)
    *(.bss .bss.*)
    *(.sbss .sbss.*)
  }

  /DISCARD/ : {
    *(.note.GNU-stack)
    *(.gnu_debuglink)
    *(.interp)
    *(.dynsym)
    *(.dynstr)
    *(.hash .gnu.hash)
    *(.comment)
    *(.dynamic)
    *(.rela.*)
    *(.rel.*)
    *(.got)
    *(.got.*)
    *(.riscv.attributes)
  }
}
