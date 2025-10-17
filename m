Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C8DBE8AFE
	for <lists+samba-technical@lfdr.de>; Fri, 17 Oct 2025 15:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3voXPutx/6DckXzQrVlMuqDlyV22H6tii8qgM+3hWfE=; b=hlNpi8hd0hjX1A36Z/XnTmJMFs
	EbzOW4DLWOHYqoTH4YqJ4BAT/O/EEsQlKlI01ix/opZMPGjpTMMCZllBbPHdoBcytKSGSvsmH9mqW
	Pf1+gLsC3Z/qwsWbMPtrC5OZNtYW0GGXNYUSdRcvc7kiYhZSRRsKoNosJ+Px5y4qFg2rNwrtEzOeJ
	3SfN588nveI5pXVH0WXvL7+0La1jLb5kuvwPWU0+qVpUVitZFCkHmm7dGA8JyfxACz/DlQO/DJ5Ip
	GV6/ctZW0rDeVaFONAIEqIDKo8hTls1q6USyel920l47gTC5t1WXX/TvVI1cVsK93S38Md7rKst/l
	h2YTWmyg==;
Received: from ip6-localhost ([::1]:55516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9k5H-0086Je-Gu; Fri, 17 Oct 2025 13:01:27 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:48218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9k5D-0086JX-Aj
 for samba-technical@lists.samba.org; Fri, 17 Oct 2025 13:01:26 +0000
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-88f27b67744so259892885a.0
 for <samba-technical@lists.samba.org>; Fri, 17 Oct 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1760706081; x=1761310881; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XsJxQRHkblBNdYNwV9Z7EgW9phErG6DBihiWxoLxQSU=;
 b=Jv/gAzCCI4NMosy08IxT31hBrhXXsUJCTZOmQID6i20SWVv23Bz1Gsv+fmZ3VZmxsP
 bLitPS5VU8+fkn/n22VsxR+1OaQzIdQUEt/oXOlv535SPKmVLTI3+nNxdp5lmlvW6Ttb
 wnV59iiIIuiVglrEoEfksf7/VQ80PWeQNj0NFJwXkaI3IjSjdpdul41m5QOeqJmYhvsp
 jz35cQfxcOSVjbCk01UyIlMBibE6RKxd+g5As8fd1vD5nfQMGnF4n8r38g/xQASo/ryH
 XncK3rSylgTpt3ovJ3mSvZqzde+tQy6SuYBSQ4nznwTrrNnm6qVZBzbD83RrmxCpqume
 2pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706081; x=1761310881;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XsJxQRHkblBNdYNwV9Z7EgW9phErG6DBihiWxoLxQSU=;
 b=ptUTHCLKPldXfIwKV/PkJAWWwyE4LF7X+08NXJwro9dTmWJR7KVoudig8ZkFZ3wCip
 T+d0ozWF+TkmPi61KDQ37uiFRZHKPUSvyNImtsd3b4e/Ja334tFyjzTmpkNqi7rGxbS2
 fWqsAggVXVX6YR3j3V0qfsHi5MG/h6PodDZ6nulAZxS9bG8ZWGqplq6ux0gCrSt1E3Ym
 nC1Ib3E8nqBUd9CT3G/MdjX7Mxpd/pAwojKWrcwulEluuUrhMVKzKGPEMYDlv+3SFxwQ
 q5s5gAp6tg3tYWdmDgOxatRcQhpyFRd0xaZaotgc4p0pkcSX6TgmZHsR45VLb4OJvIe1
 Nyqw==
X-Gm-Message-State: AOJu0Yw/ksbeyGV7b7f0pLibpLpXXgIK21hJUHQc4/gEkfbEICFLi4Dk
 oZNNcHlhYxT5gZhsC2x/YMVF3P+oJ5+1b+AWbnNGSIRPbbetajNYzFoT8woHDt5OsVBFGL2ERtP
 yX+Axt4Qwh3EW+8rukvCHVATf5TdOhV7po+shGdc=
X-Gm-Gg: ASbGncuSb/hEFj4UhlPR+FwgGkawVpEWDyYLZbz32JMEGJaxFmMlDtBkkvDTu+UxbmA
 8pa8pkJGiBeGbcqfdZsljo1YnA1xWde3RYVlkBRD9toCQskZfYdU/KRYO+zkuUORlxlxezORmhS
 7RmA3ICT18rxx8HBoq5u34PnU0v01zZpsxpn01EZTnqlnnq63l5CtrzmvJIvh2XGBSk0cdXHDzn
 phxeAyjYaLrf5NCqypANtSdiyk2hjvhlUHLjhCRXL2htkisVrG1UrmXQHJivDcpBncU/Pc62QEC
 ASI=
X-Google-Smtp-Source: AGHT+IE5LSdbXb3roQWBy+/rDTr7r7Q+h7mknOuyQ3y/wkbTi1jFTv5FbC2ZS9Z4dwFuPW2GGFO4JiKntrkj2HbCXuI=
X-Received: by 2002:a05:620a:1994:b0:862:79a9:eaf2 with SMTP id
 af79cd13be357-8906e4c845cmr439723185a.20.1760706081021; Fri, 17 Oct 2025
 06:01:21 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 09:01:10 -0400
X-Gm-Features: AS18NWDTI6QHikC6dvKGyzCSM-ePkyvn8iNX3K9bzv6r6nWrz5U6Q9BAdi-1MGM
Message-ID: <CAHCztZtZZGnEUS11oDhmSdZ1er-4sXEAtb6mb+hcBYPXn4X0Dg@mail.gmail.com>
Subject: Samba 4.22++ - RENAME_NOREPLACE w/o fallback?
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
From: Heiner Lesaar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Heiner Lesaar <heiner.lesaar@googlemail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear samba-technical,

we noticed after upgrading from Samba 4.20 to 4.22.3 (and later), that
directory creation on MacOS causes a weird folder creation "loop" when
creating a new folder in MacOS Finder. Finder basically forever keeps
creating new directories.

This is only when the underlying filesystem is BeeGFS, a parallel
filesystem which does not support RENAME_NOREPLACE.

My question: Is there a mechanism to tell Samba to revert to previous
behaviour of not using RENAME_NOREPLACE if the underlying filesystem does
not support it?

I=C2=B4ll copy their analysis here, running strace on the smbd process:

The problem seems to be at the end of this folder creation sequence:

268306 10:18:32.645081 mkdirat(27,
".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 0775) =3D 0
<0.000574>
268306 10:18:32.645728 openat(27,
".::TMPNAME:D:268306%13947819943702811000:untitled folder 3",
O_RDONLY|O_NOFOLLOW|O_PATH|O_DIRECTORY) =3D 31 <0.000026>
268306 10:18:32.645805 fstat(31, {st_mode=3DS_IFDIR|S_ISGID|0775, st_size=
=3D0,
...}) =3D 0 <0.000034>
268306 10:18:32.645899 fstat(31, {st_mode=3DS_IFDIR|S_ISGID|0775, st_size=
=3D0,
...}) =3D 0 <0.000022>
268306 10:18:32.645974 getxattr("/proc/self/fd/31",
"system.posix_acl_access", 0x7ffe67cad620, 132) =3D -1 EOPNOTSUPP (Operatio=
n
not supported) <0.000038>
268306 10:18:32.646082 setxattr("/proc/self/fd/31", "user.DOSATTRIB",
"\0\0\5\0\5\0\0\0\21\0\0\0\20\0\0\0\0\274(w\2769\334\1", 24, 0) =3D 0
<0.000199>
268306 10:18:32.646423 renameat2(27,
".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
folder 3", RENAME_NOREPLACE) =3D -1 EINVAL (Invalid argument) <0.000167>
268306 10:18:32.646656 mkdirat(27, "untitled folder 3", 000) =3D 0 <0.00063=
7>
268306 10:18:32.647406 renameat(27,
".::TMPNAME:D:268306%13947819943702811000:untitled folder 3", 27, "untitled
folder 3") =3D -1 EEXIST (File exists) <0.000211>

Samba prepares the new directory in a temporary location that is probably
hidden from the user to make the actual directory creation look atomic by
renaming the temporary directory to the actual one in the end.
There is an error with that renameat() which fails with EINVAL because
RENAME_NOREPLACE is not supported in BeeGFS. This error is not communicated
to the SMB client though.

Instead, and I don't understand why, it then continues with a mkdirat()
(which succeeds) and then another renameat() to move the temporary
directory over the just created directory. This combination of operations
results in an exisiting directory (created by the mkdirat() syscall) and
then an error to the application because of the second failed renameat().

Because the second rename returns EEXIST instead of the original EINVAL
(the actual error), the application then restarts the entire sequence with
a new name (which also is an antipattern in my opinion).


The same operation on Samba 4.20 just succeeds:

311932 12:09:08.940014 mkdirat(25, "untitled folder", 0775) =3D 0 <0.001351=
>

Many thanks for your assistance! This issue is keeping us from updating
Samba from 4.20, which is important due to the AD related security fixes
introduced in Samba 4.22.3

Kind regards,
Heiner
