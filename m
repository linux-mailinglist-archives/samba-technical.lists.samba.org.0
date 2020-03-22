Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9118EA4E
	for <lists+samba-technical@lfdr.de>; Sun, 22 Mar 2020 17:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=v5Y4+SlrU2b7nym7H+gTeBkD9n/73c2saRC3m2YN660=; b=jHDCL/C3Ct/p9xZoiz0DEutdQr
	Xk4oqR2LNSM1E+njRRZfdthONPVgPFL6SA48CfQdEpBSmbXDluFV390TTwDZE9mvUhIcsLuF2QWS3
	Qj3oBGV+atmPGd5XB1eI6MdEeFSbKpLtYALWmEr1QQ3eohuByKLlJsLZnFJ6SvkOGB5YRCe/nZngu
	a1sprU38xOcrjLWKAAMZJQwPtbKiVb7Ua8/bAVu+Iyh/5Ot48CALfJBWrX2bMR86dkA9TdS36W/Yp
	Fr8eTPbTxdswcdkR7co9O51/vgtIu0HDXmjdrmPYnmkIsCR3oiNENIWWzuVkgRFHIHCheK0RgLFip
	7mHUPfug==;
Received: from localhost ([::1]:43988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jG3PK-000Qju-Ck; Sun, 22 Mar 2020 16:25:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jG3PE-000Qjn-8U
 for samba-technical@lists.samba.org; Sun, 22 Mar 2020 16:24:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id a43so13520487edf.6
 for <samba-technical@lists.samba.org>; Sun, 22 Mar 2020 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=USZRXh12rR5fmaCuYwdE0PqeGicAgB4IKcZqJbE2ZW0=;
 b=uDEZR4mew4nC082hlIpqeSFQPQntoF7/bqUo86FjcMv6y9MBwl9RXlMM479LcH5htu
 pP+kx1RUrQ3Exu74VreqxgLEwxjZvkEMVnSRDbxFqJ6lI8j/DIVuiXtKhUMuTd+lypWO
 VeRFahi3Q3kEsxQBWbjrMPVjRLFqzRIAcFTQwgPx31MeBr+UlZ5tJTjGQOgQdebACwm8
 DP1+zLm5ZPdshVqul5HNzDv55GSgnPBU2mUo3in27/RKDRf1jUnOWiHVyJhoaM1fNTsB
 0J5edlRG3fCj9+cr2fsGJIJb/N4po8K98otrsCUlGEoLEc9yY1FODZe2VI7cnnB1UWb+
 r+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=USZRXh12rR5fmaCuYwdE0PqeGicAgB4IKcZqJbE2ZW0=;
 b=j152SRAnuzxD64jJQoHziDFABdPDAoyJiWE7tePe7YFyloV2NElYfJQ4VHXtlUflOf
 q+053HwrLM9YaJjXuu/p1bAP8CG1XQkzzTVtxOPGk5hYKJxoww1WHVuMH82bG7Qfn5WZ
 4wPrGuPbZ1+gGfOWepCVjxTijchxtswCH2FodsFFnYSKwmdXOpylS29DcHU8PWnfcrwZ
 lDSwXgr9Jj9UlfLGqJ8lpftXUfbD0RXOP/ky4RSk40bmYSVg4LNi2NpLJYHi1wo/QVpy
 NNTT5gxFHLjJ2uRGl2PYgkoHNOGkfogUsrhjkoKAu9esumiIuCqREMo1EF1egZjbSYE7
 SxkA==
X-Gm-Message-State: ANhLgQ2j3xrpeEOMtW31BXRMAHo81dpQbZ+V7qtipJV4nofSvPZWoWFD
 gduUOrPgFwegYBJxF8QWYfTVWlisgfwyXeG0M+4NgkCiKQA=
X-Google-Smtp-Source: ADFU+vsl1aGMlgP/T5/TMlDtsh5pKgtmKCBpaPhMXITeyrACKvvFgti72k2yi1UL//dDxfDH2ITimVqklIehtcaJbrQ=
X-Received: by 2002:a05:6402:1d81:: with SMTP id
 dk1mr5163863edb.205.1584894293441; 
 Sun, 22 Mar 2020 09:24:53 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 22 Mar 2020 21:54:42 +0530
Message-ID: <CAMO=cWeDUEKZYm5fDDgLhUpsagMcf_+mzmfBqaHDim4fU1W=ew@mail.gmail.com>
Subject: GSOC 2020: Introduction and queries about the MS-PAR related project
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
From: Rajendra Prajapat via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rajendra Prajapat <raj.code.pra@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Everyone

This is Rajendra Prajapat, 3rd-year computer science student from
IIIT-Dharwad, India. I am interested to work on the project idea "Print
System Asynchronous Remote Protocol Wireshark Dissectors" during GSOC-2020.
Last few days I was exploring MS-CIFS, MS-PAR and MS-RPRN protocols. I am
good at C, C++ and python programming. I have prior knowledge of working
with Wireshark.

I am not able to connect to IRC channel #samba-technical.

From the idea page, I got to know about the following tasks

- Write Wireshark dissectors for MS-PAR

- Improve existing smbtorture tests, Which demonstrate how the protocol
works against a Windows server.


Please let me know where to get started for MS-PAR protocol and are there
any tasks, which we can do to improve the proposal before submitting it?


The link for G=C3=BCnther and Andreas' SambaXP presentation
<http://archive.sambaxp.org/fileadmin/user_upload/SambaXP2013-DATA/thu/trac=
k2/Guenther_Deschner_Andreas_Schneider-Printing_Samba_4.pdf>
is
not working on the idea page. Can you please provide the new link of the
G=C3=BCnther and Andreas' SambaXP presentation?


Regards

Rajendra Prajapat
