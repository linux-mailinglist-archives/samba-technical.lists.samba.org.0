Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9C115337
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 15:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wfIc+STMqWgKnJDy3LQS8TeLEyJ+0bzh8e1h+xpUCIw=; b=NJ/3+hrbVO5hVEub9/qIPea6St
	nCvk5vRNJM/mOcYW15fxxkXI9XxE3tQeZT53vmu7yrKnz4qI5YFvvmcXO6KR+EcvJYVzvDAcOeMEI
	syWnc9J+gE6O0ncJ/U+btwpOd29v7Q6YILOFy2d52tGMJfnOXjAw4DxPrAPW81ZAoWauPHa1F659q
	ytn74Cffb5Kq93kS1X+t1aQeqr2clHXSHmfy3AggaTM8llG6DIs7srf+kXONnWcVjHU/AN+tn6Bxo
	df6o11ojz6ntZb2/sbFZ2U22exL9xRgDsmbi+oTHJazBnMOMVfggfNUjAYEdCEPSEBDiSDXXQrG+8
	ktxJqX1A==;
Received: from localhost ([::1]:31312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1idEfa-006QpJ-SH; Fri, 06 Dec 2019 14:33:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54349) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1idEfV-006QpC-QF
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 14:33:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id b11so8032592wmj.4
 for <samba-technical@lists.samba.org>; Fri, 06 Dec 2019 06:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=wfIc+STMqWgKnJDy3LQS8TeLEyJ+0bzh8e1h+xpUCIw=;
 b=QEsIe/Q4NoBEXL3cX1JnFBAISTqJZx9evyNCX5Lvg7YoYJfsgfL6D9YuBwppANE/71
 fiI91OlMNHmPV84VIkaYOOt8IPzCx5dbnqEn6tst52E+aBUZZb38zrJgpKL1x41VdV+W
 HcHlrMKiV7UgLrjZRNAbaYbm+jDmfTcIDCjvFJ65QLUvBBbp/45TfCbetajkxgYtC4Ip
 ihzToiKCOvmcbT3QHuQnbVgMsNrEuy2BUKKScSgLh/BFVIGbsXUWO+AAVR+FP6TdC2tQ
 p6z/v78by+TyivYLQMSd7z16xQROkQedtDxSRcmLMgx20OYPVURfcSOMyTpx0bGSjAzH
 WolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=wfIc+STMqWgKnJDy3LQS8TeLEyJ+0bzh8e1h+xpUCIw=;
 b=bOKzUhFSnmMy5debpkcq2Odk2X02m0IUwt5+rO/5Nwf3Glb7edIiq6KKZ+K5lsnhVx
 /Xa38n+i+G+1JxAOPgR/Jfas3cEfLULbd3PuoXDKx2iFGKQgU14Fq4LSL96le6iFu0Xt
 OH2wR3VG9eaChEjeIZ79p8bs9+ZezS10y1wU0UAnzq/OMe2lOYffG00Gghi532RNPlzT
 jxKLPtFP6TQQ+54kcw+pWeDSDEfI/9vQIV0WYD+hGdvR3JOIj9Bvg6yG2iTVnus30fRe
 G6oj/WEmjL6opxhtrJIdbi90Luj/rihoHC0byEZi0nreJX4nchC0R5lpt9yu3qnZ9tIm
 PN8w==
X-Gm-Message-State: APjAAAXo4LvKTHMDwyX9OLXN1/Sy9fVf5AeIjz625Glp0ZfE4kuJyEcl
 yRW+zPu3be9wf7Lakol7kqUr7l/HOAUoaPnQnPI/Mspw
X-Google-Smtp-Source: APXvYqzJOm/32TYnwOlgxu7BdqXxO/43UtnG2YgbTdRyDiKQVSvfzFCwlBeTz6lFnzpeBf6YrivMc+CLTK5Lw6+fO9k=
X-Received: by 2002:a1c:4483:: with SMTP id r125mr10660230wma.97.1575642794514; 
 Fri, 06 Dec 2019 06:33:14 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Dec 2019 06:31:15 -0800
Message-ID: <CACyXjPynemywXYPzdz5eB=gYJawxxU8M+XKCaZAt0CZc8WHnYQ@mail.gmail.com>
Subject: Do the tests not like documentation changes or ...
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

I created the following change to the documentation:

--------------------
index 8275d313ed1..948b98936a2 100644
--- a/docs-xml/Samba-Developers-Guide/vfs.xml
+++ b/docs-xml/Samba-Developers-Guide/vfs.xml
@@ -235,14 +235,14 @@ DO NOT ACCESS conn-&gt;vfs.ops.* directly !!!
 #define SMB_VFS_CLOSE(fsp, fd) \
        ((fsp)-&gt;conn-&gt;vfs.ops.close(\
        (fsp)-&gt;conn-&gt;vfs.handles.close, (fsp), (fd)))
-#define SMB_VFS_READ(fsp, fd, data, n) \
+#define SMB_VFS_PREAD(fsp, fd, data, n, off) \
        ((fsp)-&gt;conn-&gt;vfs.ops.read(\
        (fsp)-&gt;conn-&gt;vfs.handles.read,\
-        (fsp), (fd), (data), (n)))
-#define SMB_VFS_WRITE(fsp, fd, data, n) \
+        (fsp), (fd), (data), (n), (off)))
+#define SMB_VFS_PWRITE(fsp, fd, data, n, off) \
        ((fsp)-&gt;conn-&gt;vfs.ops.write(\
        (fsp)-&gt;conn-&gt;vfs.handles.write,\
-        (fsp), (fd), (data), (n)))
+        (fsp), (fd), (data), (n), (off)))
 #define SMB_VFS_LSEEK(fsp, fd, offset, whence) \
        ((fsp)-&gt;conn-&gt;vfs.ops.lseek(\
        (fsp)-&gt;conn-&gt;vfs.handles.lseek,\
------------------

I did a build locally to ensure every thing looked OK.

I then created a PR (merge request) on GitLab, and it failed.
(https://gitlab.com/samba-team/samba/merge_requests/975)

Did I do something wrong?

Is there something else I should have done?

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

