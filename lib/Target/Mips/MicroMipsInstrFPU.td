let isCodeGenOnly = 1, Predicates = [InMicroMips] in {
def FADD_S_MM : MMRel, ADDS_FT<"add.s", FGR32Opnd, IIFadd, 1, fadd>,
                ADDS_FM_MM<0, 0x30>;
def FDIV_S_MM : MMRel, ADDS_FT<"div.s", FGR32Opnd, IIFdivSingle, 0, fdiv>,
                ADDS_FM_MM<0, 0xf0>;
def FMUL_S_MM : MMRel, ADDS_FT<"mul.s", FGR32Opnd, IIFmulSingle, 1, fmul>,
                ADDS_FM_MM<0, 0xb0>;
def FSUB_S_MM : MMRel, ADDS_FT<"sub.s", FGR32Opnd, IIFadd, 0, fsub>,
                ADDS_FM_MM<0, 0x70>;

def FADD_MM  : MMRel, ADDS_FT<"add.d", AFGR64Opnd, IIFadd, 1, fadd>,
               ADDS_FM_MM<1, 0x30>;
def FDIV_MM  : MMRel, ADDS_FT<"div.d", AFGR64Opnd, IIFdivDouble, 0, fdiv>,
               ADDS_FM_MM<1, 0xf0>;
def FMUL_MM  : MMRel, ADDS_FT<"mul.d", AFGR64Opnd, IIFmulDouble, 1, fmul>,
               ADDS_FM_MM<1, 0xb0>;
def FSUB_MM  : MMRel, ADDS_FT<"sub.d", AFGR64Opnd, IIFadd, 0, fsub>,
               ADDS_FM_MM<1, 0x70>;

def LWC1_MM : MMRel, LW_FT<"lwc1", FGR32Opnd, IIFLoad, load>, LW_FM_MM<0x27>;
def SWC1_MM : MMRel, SW_FT<"swc1", FGR32Opnd, IIFStore, store>,
              LW_FM_MM<0x26>;
def LDC1_MM : MMRel, LW_FT<"ldc1", AFGR64Opnd, IIFLoad, load>, LW_FM_MM<0x2f>;
def SDC1_MM : MMRel, SW_FT<"sdc1", AFGR64Opnd, IIFStore, store>,
              LW_FM_MM<0x2e>;
def LWXC1_MM : MMRel, LWXC1_FT<"lwxc1", FGR32Opnd, IIFLoad, load>,
               LWXC1_FM_MM<0x48>;
def SWXC1_MM : MMRel, SWXC1_FT<"swxc1", FGR32Opnd, IIFStore, store>,
               SWXC1_FM_MM<0x88>;
def LUXC1_MM : MMRel, LWXC1_FT<"luxc1", AFGR64Opnd, IIFLoad>,
               LWXC1_FM_MM<0x148>;
def SUXC1_MM : MMRel, SWXC1_FT<"suxc1", AFGR64Opnd, IIFStore>,
               SWXC1_FM_MM<0x188>;

def FCMP_S32_MM : MMRel, CEQS_FT<"s", FGR32, IIFcmp, MipsFPCmp>,
                  CEQS_FM_MM<0>;
def FCMP_D32_MM : MMRel, CEQS_FT<"d", AFGR64, IIFcmp, MipsFPCmp>,
                  CEQS_FM_MM<1>;

def BC1F_MM : MMRel, BC1F_FT<"bc1f", brtarget_mm, IIBranch, MIPS_BRANCH_F>,
              BC1F_FM_MM<0x1c>;
def BC1T_MM : MMRel, BC1F_FT<"bc1t", brtarget_mm, IIBranch, MIPS_BRANCH_T>,
              BC1F_FM_MM<0x1d>;

def CEIL_W_S_MM  : MMRel, ABSS_FT<"ceil.w.s", FGR32Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0x6c>;
def CVT_W_S_MM   : MMRel, ABSS_FT<"cvt.w.s", FGR32Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0x24>;
def FLOOR_W_S_MM : MMRel, ABSS_FT<"floor.w.s", FGR32Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0x2c>;
def ROUND_W_S_MM : MMRel, ABSS_FT<"round.w.s", FGR32Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0xec>;
def TRUNC_W_S_MM : MMRel, ABSS_FT<"trunc.w.s", FGR32Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0xac>;
def FSQRT_S_MM : MMRel, ABSS_FT<"sqrt.s", FGR32Opnd, FGR32Opnd,IIFsqrtSingle,
                                fsqrt>, ROUND_W_FM_MM<0, 0x28>;

def CEIL_W_MM  : MMRel, ABSS_FT<"ceil.w.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                 ROUND_W_FM_MM<1, 0x6c>;
def CVT_W_MM   : MMRel, ABSS_FT<"cvt.w.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                 ROUND_W_FM_MM<1, 0x24>;
def FLOOR_W_MM : MMRel, ABSS_FT<"floor.w.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                 ROUND_W_FM_MM<1, 0x2c>;
def ROUND_W_MM : MMRel, ABSS_FT<"round.w.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                 ROUND_W_FM_MM<1, 0xec>;
def TRUNC_W_MM : MMRel, ABSS_FT<"trunc.w.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                 ROUND_W_FM_MM<1, 0xac>;

def FSQRT_MM : MMRel, ABSS_FT<"sqrt.d", AFGR64Opnd, AFGR64Opnd,
                              IIFsqrtDouble, fsqrt>, ROUND_W_FM_MM<1, 0x28>;

def CVT_L_S_MM   : MMRel, ABSS_FT<"cvt.l.s", FGR64Opnd, FGR32Opnd, IIFcvt>,
                   ROUND_W_FM_MM<0, 0x4>;
def CVT_L_D64_MM : MMRel, ABSS_FT<"cvt.l.d", FGR64Opnd, FGR64Opnd, IIFcvt>,
                   ROUND_W_FM_MM<1, 0x4>;

def FABS_S_MM : MMRel, ABSS_FT<"abs.s", FGR32Opnd, FGR32Opnd, IIFcvt, fabs>,
                ABS_FM_MM<0, 0xd>;
def FMOV_S_MM : MMRel, ABSS_FT<"mov.s", FGR32Opnd, FGR32Opnd, IIFmove>,
                ABS_FM_MM<0, 0x1>;
def FNEG_S_MM : MMRel, ABSS_FT<"neg.s", FGR32Opnd, FGR32Opnd, IIFcvt, fneg>,
                ABS_FM_MM<0, 0x2d>;
def CVT_D_S_MM : MMRel, ABSS_FT<"cvt.d.s", AFGR64Opnd, FGR32Opnd, IIFcvt>,
                 ABS_FM_MM<0, 0x4d>;
def CVT_D32_W_MM : MMRel, ABSS_FT<"cvt.d.w", AFGR64Opnd, FGR32Opnd, IIFcvt>,
                   ABS_FM_MM<1, 0x4d>;
def CVT_S_D32_MM : MMRel, ABSS_FT<"cvt.s.d", FGR32Opnd, AFGR64Opnd, IIFcvt>,
                   ABS_FM_MM<0, 0x6d>;
def CVT_S_W_MM : MMRel, ABSS_FT<"cvt.s.w", FGR32Opnd, FGR32Opnd, IIFcvt>,
                 ABS_FM_MM<1, 0x6d>;

def FABS_MM : MMRel, ABSS_FT<"abs.d", AFGR64Opnd, AFGR64Opnd, IIFcvt, fabs>,
              ABS_FM_MM<1, 0xd>;
def FNEG_MM : MMRel, ABSS_FT<"neg.d", AFGR64Opnd, AFGR64Opnd, IIFcvt, fneg>,
              ABS_FM_MM<1, 0x2d>;

def FMOV_D32_MM : MMRel, ABSS_FT<"mov.d", AFGR64Opnd, AFGR64Opnd, IIFmove>,
                  ABS_FM_MM<1, 0x1>, Requires<[NotFP64bit, HasStdEnc]>;
}
