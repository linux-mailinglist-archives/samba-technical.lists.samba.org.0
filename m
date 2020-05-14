Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6971D260B
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 06:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=11sDHSeTbefp7upecVfERYTbWBxzsm7DVb1iqPDpy9Q=; b=Z9yB5bUkd2MCA+Skg9G3TiDNwf
	Z5ULLI0VngYy8PyX5Hw4dqqu67iPHUeeBk/rEPlXc5HzBZA6W/Mz9E5M9oUu12zAuHVVr7jdLXH4h
	MFQCN+PcqbbRBCK6YPcC1ipphA+fQ62DEaSBpGFHDRt9YH3XQRW4Doqewv8UqVqpEHtPyL9yR2HyS
	k7gIoAo021WnWtHYBThMrMOPiFf4x7mNkL1J5HgsCH820wv/YWQjKFlFx7RFVoBdh0kferyx83ZQe
	vZPzDy6os3DGx2uBWV1d1OObEjl3H4JpsvQwrtC3Qlu8/ptBJiR5SJj8BX31cntHkRlaPU4mXbXgo
	TdVeb6Zw==;
Received: from localhost ([::1]:57204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ5ob-004Hv0-A5; Thu, 14 May 2020 04:49:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ5oS-004Hut-Id
 for samba-technical@lists.samba.org; Thu, 14 May 2020 04:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=11sDHSeTbefp7upecVfERYTbWBxzsm7DVb1iqPDpy9Q=; b=nvy+7tML3KnYFIkyKfRtccxBob
 +Z7Een0mljUV+y5NaeYY90LkbiOkfx8dJiAF+HnryL7PHCb/fziqWOIGBzDYrtaV80RhhGJmOLDO4
 e02zNY+560bw22d05LdVF0k5C9MEk5BGnmoOCdSY7y3OwY5yeCP6wxA7pSTJwntcODWabdaYPNNyO
 pNOfOzctptL5ASu4sFGT1+ue77oCcEykFgLZZ0S38fNg1h4gnkhpoIDfGuScTY1QeVBZUu89bVvJG
 eUx+IFBbQrFI6vfv+iQhEGbLdUrrRrEcOTKveDeYOy3Lbj0mabdw7HV+VzVrB6NpwMfrsO1E/69CN
 66fzQ4Azvr3zvhnjebHVlOjNQ4k3Z+c+5tou9VhjzoOF2MCJnpJVaHkRo/hi9QDfthSLZZUH/KztD
 CMc/PWrnKxYcmZVP6ghlHYUVGe2oeVh4ons/VRTt4owodbwVDt/TUhM4ElEMdnFg7FsNEya4T3Ybw
 hRvIjMuADIgLp7KwJXzn+rTM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ5oQ-00071A-NJ; Thu, 14 May 2020 04:49:39 +0000
Date: Wed, 13 May 2020 21:49:32 -0700
To: Michael Adam <obnox@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514044932.GA2653@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
In-Reply-To: <20200513233612.GB7185@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 01:36:12AM +0200, Michael Adam wrote:
> Two questions remain:
> 
> - Should we implement the behavior stated in the manpage?
>   (I think yes!)

Attached is the naieve patch to do that (change us
to manpage behavior). I'm willing to bet it breaks
a bunch of tests (and possibly user expectations)
though...


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=look

diff --git a/source3/smbd/dosmode.c b/source3/smbd/dosmode.c
index 9bb8d1c1941..782d9206dbb 100644
--- a/source3/smbd/dosmode.c
+++ b/source3/smbd/dosmode.c
@@ -170,14 +170,16 @@ mode_t unix_mode(connection_struct *conn, int dosmode,
 			result |= lp_force_directory_mode(SNUM(conn));
 		}
 	} else { 
-		if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
-			result |= S_IXUSR;
+		if (!lp_store_dos_attributes(SNUM(conn))) {
+			if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
+				result |= S_IXUSR;
 
-		if (lp_map_system(SNUM(conn)) && IS_DOS_SYSTEM(dosmode))
-			result |= S_IXGRP;
+			if (lp_map_system(SNUM(conn)) && IS_DOS_SYSTEM(dosmode))
+				result |= S_IXGRP;
 
-		if (lp_map_hidden(SNUM(conn)) && IS_DOS_HIDDEN(dosmode))
-			result |= S_IXOTH;  
+			if (lp_map_hidden(SNUM(conn)) && IS_DOS_HIDDEN(dosmode))
+				result |= S_IXOTH;  
+		}
 
 		if (dir_mode) {
 			/* Inherit 666 component of parent directory mode */

--AhhlLboLdkugWU4S--

