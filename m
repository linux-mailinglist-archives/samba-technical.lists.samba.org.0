Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B874472CE
	for <lists+samba-technical@lfdr.de>; Sun, 16 Jun 2019 06:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oXBwVztjAj88fXMXyJXoMrO0OxhqbdJmzdfqog0uSSE=; b=qsxDb9Lex7yO4FccmSr54qmQ9M
	hNkEINxd6lmX0jsuLiiMHxcn+NcuStl9XYouiMw4G2n7BhLMAdoIjQVHQnb90H3OaC/x81jnL4Tqe
	e4LSKLhE/YU6gysnmupox/Ttjz78K1HosowZYmiW07nI/7cov0t0n03htD/OjT1Csww/q0lL6EiQo
	7uVlsAj41VOn8V/H8NbAsgsss+Fr9bAx07tL/eUQU2s5LHESDOJn6X/0KwP2inn4PlBTxW2cQ1/oM
	WM1eYbGqkFTknnl+nvATZ2ca6yADC7Xp5WRri2mlqHqFejTaDAx5tzUAs/WSmLMzjuWgdmO38K4RM
	GekfvB7g==;
Received: from localhost ([::1]:58662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hcMdD-000bLV-OA; Sun, 16 Jun 2019 04:19:03 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33863) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hcMd9-000bLO-Hl
 for samba-technical@lists.samba.org; Sun, 16 Jun 2019 04:19:01 +0000
Received: by mail-pg1-x543.google.com with SMTP id p10so3886323pgn.1
 for <samba-technical@lists.samba.org>; Sat, 15 Jun 2019 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oXBwVztjAj88fXMXyJXoMrO0OxhqbdJmzdfqog0uSSE=;
 b=Pt6kDmt5IrfWPgAx+wNy2N6HN8ArpCuDlocDfs3TAbejcYeTVht9QoCUcPyV57NUam
 N5i1uTXYCede/nPFfI5e03di2At0yKMB/LIXB3wn5e9ZogHXyzH/bQzjUaB8BYcaBi80
 uPjsU3435fRxySRPyyQwSYzJeXwE2vhZ7eyUjTf9rxA1VzJKcJxsQihkPsMhIZVbBk9n
 QAGjApSgIXmyKWNAE3iWjd6QF5Bsb17+fausBZeuU+CU4guVUZKNHl3khLYm5p4Tgaa9
 teIczMAHe21GXZ4kZ5+Eog8t9enZHi9W39KSDBhAdUt+fKwID6gRYC5ktrzMRn+im3oe
 97Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oXBwVztjAj88fXMXyJXoMrO0OxhqbdJmzdfqog0uSSE=;
 b=FTiibS6NZVmikdOKnsYX0xSNW/JLk+N6UfHlYVBRIov27sd4Wlgl1pS6DBIgqYVSd2
 3RHYHiaII36HUyBF8RrTFQxMIQb19JH/b3/ssYr7ULZTU573VcSByMakCvNNJGwxvrjO
 ovVb/SMgigtW1bcjTwpo/oNMZyLv/HUmZwyxQ7bkTeYql7ziROmbVwKjwCIYajl41xs2
 JR5O36CqxfqAZ6JuR+aYxrclk1obxatJPJnP2leMhtZdPFPNxanX3T1dUfIxSJoiW6sv
 bSGx4oFbeTvUUwVSFqG6LZZNX+MpU1rf32voI4qT6JkO2YSyAHSD2fB/zoWLS/BN48Ho
 puZQ==
X-Gm-Message-State: APjAAAVqmDabYMIitsEP919WAzTDiT5fPdyfU/SgI697RsaaLuhsKGb+
 M0ebK+KGAsHOXE9kTTbYdJrhzZfIyDw8C/gyDmY=
X-Google-Smtp-Source: APXvYqxzlSZtZDSVHGB8zqWrd5hLzgGuHsxnuQfoor5TBaxgLdYtM/187Dkkw64kfK8OjTRdfOt1P+9SupB7K0CtIbc=
X-Received: by 2002:a17:90a:2385:: with SMTP id
 g5mr19764693pje.12.1560658736328; 
 Sat, 15 Jun 2019 21:18:56 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 15 Jun 2019 23:18:45 -0500
Message-ID: <CAH2r5mvo9sWf8VoPb8puCDh4HM6WnrMgjs+HyhUzqEZXtuQwtA@mail.gmail.com>
Subject: NT_STATUS_INSUFFICIENT_RESOURCES and retrying writes to Windows 10
 servers
To: Pavel Shilovsky <piastryyy@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>, 
 Paulo Alcantara <paulo@paulo.ac>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

By default large file copy to Windows 10 can return MANY potentially
retryable errors on write (which we don't retry from the Linux cifs
client) which can cause cp to fail.

It did look like my patch for the problem worked (see below).  Windows
10 returns *A LOT* (about 1/3 of writes in some cases I tried) of
NT_STATUS_INSUFFICIENT_RESOURCES errors (presumably due to the
'blocking operation credit' max of 64 in Windows 10 - see note 203 of
MS-SMB2).

"<203> Section 3.3.4.2: Windows-based servers enforce a configurable
blocking operation credit,
which defaults to 64 on Windows Vista SP1, Windows 7, Windows 8,
Windows 8.1, and, Windows 10,
and defaults to 512 on Windows Server 2008, Windows Server 2008 R2,
Windows Server 2012 ..."

This patch did seem to work around the problem, but perhaps we should
use far fewer credits when mounting to Windows 10 even though they are
giving us enough credits for more? Or change how we do writes to not
do synchronous writes? I haven't seen this problem to Windows 2016 or
2019 but perhaps the explanation on note 203  is all we need to know
... ie that clients can enforce a lower limit than 512

~/cifs-2.6/fs/cifs$ git diff -a
diff --git a/fs/cifs/smb2maperror.c b/fs/cifs/smb2maperror.c
index e32c264e3adb..82ade16c9501 100644
--- a/fs/cifs/smb2maperror.c
+++ b/fs/cifs/smb2maperror.c
@@ -457,7 +457,7 @@ static const struct status_to_posix_error
smb2_error_map_table[] = {
        {STATUS_FILE_INVALID, -EIO, "STATUS_FILE_INVALID"},
        {STATUS_ALLOTTED_SPACE_EXCEEDED, -EIO,
        "STATUS_ALLOTTED_SPACE_EXCEEDED"},
-       {STATUS_INSUFFICIENT_RESOURCES, -EREMOTEIO,
+       {STATUS_INSUFFICIENT_RESOURCES, -EAGAIN,
                                "STATUS_INSUFFICIENT_RESOURCES"},
        {STATUS_DFS_EXIT_PATH_FOUND, -EIO, "STATUS_DFS_EXIT_PATH_FOUND"},
        {STATUS_DEVICE_DATA_ERROR, -EIO, "STATUS_DEVICE_DATA_ERROR"},


e.g. see the number of write errors in my 8GB copy in my test below

# cat /proc/fs/cifs/Stats
Resources in use
CIFS Session: 1
Share (unique mount targets): 2
SMB Request/Response Buffer: 1 Pool size: 5
SMB Small Req/Resp Buffer: 1 Pool size: 30
Operations (MIDs): 0

0 session 0 share reconnects
Total vfs operations: 363 maximum at one time: 2

1) \\10.0.3.4\public-share
SMBs: 14879
Bytes read: 0  Bytes written: 8589934592
Open files: 2 total (local), 0 open on server
TreeConnects: 3 total 0 failed
TreeDisconnects: 0 total 0 failed
Creates: 12 total 0 failed
Closes: 10 total 0 failed
Flushes: 0 total 0 failed
Reads: 0 total 0 failed
Writes: 14838 total 5624 failed
...

Any thoughts?

Any risk that we could run into places where EAGAIN would not be
handled (there are SMB3 commands other than read and write where
NT_STATUS_INSUFFICIENT_RESOURCES could be returned in theory)

-- 
Thanks,

Steve

