Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C7820F1D
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 21:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5d6i92EnUfaOW/t+0mSyYZrN14tDKwn35sWBCmslD1o=; b=gWc7z3zWj9urzxIKcAuSN6zauM
	VwEJ8Gr65mLudlYMAwRwEdJtJ335nhQOtSebt8hjDSTFYuMEPWF3Dxg6UzcRS+02S5JHM21uJfjWg
	NC7GZtB+yMujkfZ6Cq3KsoChid/lAzUS5cyo4IZ9d7rw2znUMeE9Pg0kqLoJQjRDnlV2ReNQSQLyJ
	dLhVvlwBbp0mDdsgVCsU14QW+2vdWXvq6Hgex5G6mMn57H8rYNY8+V3fOLof/7axqrIJRP1lWo4FW
	nrey6zehhraOCosyNm93sfTl/p1TM5EIhy0Z08CZ/KlVPwphXbj3osWnvPfblRs/+T4CkTozeQH21
	TPoxIlnQ==;
Received: from localhost ([::1]:54248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRLrH-000AzZ-JJ; Thu, 16 May 2019 19:16:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41570) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRLrD-000AzS-PH
 for samba-technical@lists.samba.org; Thu, 16 May 2019 19:16:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id g12so4306351wro.8
 for <samba-technical@lists.samba.org>; Thu, 16 May 2019 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=5d6i92EnUfaOW/t+0mSyYZrN14tDKwn35sWBCmslD1o=;
 b=SZD6gDd1Pf8Ve9SbLnStkAxnkY1tl27Xmt2Kuo5TtEPqAzQ/ePZf5ufYblgrjvOQpw
 ykh50XrBlz0i9gNkZgs98E7DClevbxmkptpwYmxL7tR9+A5trpdKnfmJyshE1KeTN0Zn
 IrzEvklkwpGD4f2flLejqi1PLX7SkP73wB8hw/V6X9wArk+7cOgnY0kFaatFllZ6o5cG
 s5caS5fnjzOUs9sREuj9LHuk4hO/X5APhEQxQQJGrQPsZ263vFkTPE/xw6U9hjqiglp3
 0haknc6Usf2MyH6dN1JBMIT1CDS5Eo4Kio6C9cr2NMljT2NlD9wFQ31ZWmq+Ea/GhRhS
 fTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=5d6i92EnUfaOW/t+0mSyYZrN14tDKwn35sWBCmslD1o=;
 b=kxdClkGlB6I+nVdTiKBXz7vKEHwtS8qYhl+Vhy2gk+f7M10yB0S77T8E7gyeNl3psY
 XH7tYeKX4ZzrMtay6XfY6/zxXMMMVWqX79SfrwHVcJz79l2UTG4iWQoxDFVrfGK+hN84
 uPGOr46oc+HojYLFYxhKmUOoHqFjS2qdB14UTb4stzrlRLKlK7z1gzAnWGCRkZzlnh8R
 JLG8W+8dIYluwHo+DRmaysvC+B7c7bcKyjgAr4RgEWrqHD9xKDn9jThJKLGsayrPMBEM
 j7BzBOILV19jfffW/ZFzYOXfUCc2iYuqAixlYs2iNXEGvrvt1wPMjy/t6iPd3X5xh/2N
 JHqQ==
X-Gm-Message-State: APjAAAWurfsXz7Cr4aKztWxYvwRlKofzeZkrtEgSPUmEzNR1xP7vpRvJ
 k7Vw/grxBYpPhHaBXPO494oCWh8yETgrvfAutYzCMNfS
X-Google-Smtp-Source: APXvYqwS5tsH0TvUbvVVaStArBwck4V0AvwDTe5Cv48C+eZj7d3bU5K73RKdThr1/FW5LDBep0RzwHKUT4owTjjKVyY=
X-Received: by 2002:adf:c188:: with SMTP id x8mr20976126wre.256.1558034155016; 
 Thu, 16 May 2019 12:15:55 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 May 2019 12:14:39 -0700
Message-ID: <CACyXjPw5KdTqu1z+u5PzgYFCh3gsE6C8vPd+Yi0tnWLrLOHMzw@mail.gmail.com>
Subject: Hitting Could not claim version: NT_STATUS_IO_TIMEOUT
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I am hitting the following (in 4.7.1) in a CTDB-setup, and am looking
for hints on how to debug it.

--------------------
[2019/05/16 18:49:24.648838,  5, pid=3D21261, effective(0, 0), real(0,
0)] ../lib/dbwrap/dbwrap.c:160(dbwrap_check_lock_order)
  check lock order 3 for g_lock.tdb
[2019/05/16 18:49:24.648880, 10, pid=3D21261, effective(0, 0), real(0,
0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
  lock order:  1:<none> 2:<none> 3:g_lock.tdb
[2019/05/16 18:49:24.648908, 10, pid=3D21261, effective(0, 0), real(0,
0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:1112(fetch_locked_internal)
  Locking db 1294615339 key 73616D62615F76657273
[2019/05/16 18:49:24.648935,  5, pid=3D21261, effective(0, 0), real(0,
0)] ../lib/dbwrap/dbwrap.c:128(dbwrap_lock_order_state_destructor)
  release lock order 3 for g_lock.tdb
[2019/05/16 18:49:24.648958, 10, pid=3D21261, effective(0, 0), real(0,
0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
  lock order:  1:<none> 2:<none> 3:<none>
[2019/05/16 18:49:24.648963, 10, pid=3D21261, effective(0, 0), real(0,
0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:980(db_ctdb_record_destr)
  Unlocking db 1294615339 key 73616D62615F76657273
[2019/05/16 18:49:24.648977,  1, pid=3D21261, effective(0, 0), real(0,
0)] ../source3/smbd/server.c:1497(smbd_claim_version)
  smbd_claim_version: g_lock_lock(G_LOCK_READ) failed: NT_STATUS_IO_TIMEOUT
[2019/05/16 18:49:24.649000,  1, pid=3D21261, effective(0, 0), real(0,
0)] ../source3/smbd/server.c:2024(main)
  main: Could not claim version: NT_STATUS_IO_TIMEOUT
---------------------

This is a four-node ctdb setup which was upgraded recently, but as far
as I can see all nodes are at the same version and the problem is
grabbing the lock.

This piece of code took the error path:

        status =3D g_lock_lock(ctx, name, G_LOCK_READ,
                             (struct timeval) { .tv_sec =3D 60 });
        if (!NT_STATUS_IS_OK(status)) {
                DBG_WARNING("g_lock_lock(G_LOCK_READ) failed: %s\n",
                            nt_errstr(status));
                TALLOC_FREE(ctx);
                return status;
        }

Anyone have any idea what that is about or how to debug it further?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

