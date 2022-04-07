Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B64F8746
	for <lists+samba-technical@lfdr.de>; Thu,  7 Apr 2022 20:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=noQ8vVMTmxy+0kccojNmISAL9vJt+oxfm1+PRHJbJ8s=; b=lGwdDq61Hb9jzQgD5uYNvwYSqj
	uXZhfrFm8vFxdRKqhaxgoFudZ+YzSJ5WckK+lYF1uRN9N9gV6ycLSe4MCfyv+I3DPvvpboDv/7SQO
	i0XcfIMOEcKAqe4vZw8S7pgY4y6EihUEFEkFk1XwO/zKIdlKst9RWiql+ZLtEROLuUmc8Au0VB4v0
	/dMNdKEdhPSImbakiI8ALk9ml/olNNov4ZJEe8XMYXdMcjLRisFdFw5G6yWvdkQ+tA9BnMi06SFjJ
	2ocr00uKDL62JRx2oBbQyPsYOeBCF2pvyuoO1ZQS3qak0uEOyJUNsVWdBrPapymDoBUK9eA3cUX6H
	ygsX/sGw==;
Received: from ip6-localhost ([::1]:35972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncX6w-00AuDO-1g; Thu, 07 Apr 2022 18:44:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncX6o-00AuCq-Fw; Thu, 07 Apr 2022 18:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=noQ8vVMTmxy+0kccojNmISAL9vJt+oxfm1+PRHJbJ8s=; b=i6IM+JVRNWBJYf64ZBCFKOuib7
 eBzJERSecIYOEqT9/zQfcGCWcFoGSTET7yH685p/0T7l1ISVK7s3j+S/bmJEbLeESMYKCDz8f9nkq
 xfu21iEseOdLPuGDi6+WFXIW9hyDSxqbl00KttxE4rhF3SBOkHOgwMaOH2sAmToPsfUOI/qpDW5GS
 fDcfM76+GuxjLAfocXssjm2uwzuTy1ZdiZ7uAJFLrJz2gSkbFy1iR2TrN/PSIeEaAFVUKHUOpuqzn
 Ao45OGMaUpq73fUEHFz4jCX77AWARXk3R8ckv/HvZnvLovVL2pQVhgeEK7zF9u1BbHc2gsWR5a3nM
 XZzy7IQbMNOWfzQvEKHHxLkhQp68zNept2GZCRAoqoSbdQiB2ib2p4PgM1tw1T3QhiSTSnSZagZEu
 rhuAYENm03cCUkx8O/P3HnrvxZgPT9h6kf2e4r/O34p3XIyRP2wyXRnaKNb7J+MFzkCSGbDbePK32
 Z7zQzPQ/aany9xKP2EUPRg52;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncX6n-005tSh-Lg; Thu, 07 Apr 2022 18:43:54 +0000
Date: Thu, 7 Apr 2022 11:43:49 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: SMB1 can now be removed from the server code !
Message-ID: <Yk8w5TWMP7bKmy0z@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

Just wanted to let everyone know about a milestone in
coding achieved by David Mulder from SuSE.

David reconfigured our codebase to allow the SMB1 code
inside smbd to be removed using an option at configure
time !

Configure Samba using:

configure --without-smb1-server

and smbd will now no longer include any of the SMB1
legacy protocol other than the minimal "bootstrap"
code needed to allow a Windows client to first contact
the server via SMB1 "negotiate protocol" and then
immediately switch to SMB2 (when the smbd server
tells it we no longer support SMB1). This is the
same way a Windows server behaves once SMB1 support
is removed.

This new feature will be available in 4.17.0 (whenever
we ship that :-) but I wanted everyone to know SMB1
is on its way out !

Note that SMB1 support is still allowed in the libsmbclient
libraries to keep maximum backwards compatibility to
legacy servers.

Here is the new WHATSNEW.txt entry.

----------------------------------------------------------------------
Configure without the SMB1 Server
---------------------------------

It is now possible to configure Samba without support for
the SMB1 protocol in smbd. This can be selected at configure
time with either of the options:

--with-smb1-server
--without-smb1-server

By default (without either of these options set) Samba
is configured to include SMB1 support (i.e. --with-smb1-server
is the default). When Samba is configured without SMB1 support,
none of the SMB1 code is included inside smbd except the minimal
stub code needed to allow a client to connect as SMB1 and immediately
negotiate the selected protocol into SMB2 (as a Windows server also
allows).

None of the SMB1-only smb.conf parameters are removed when
configured without SMB1, but these parameters are ignored by
the smbd server. This allows deployment without having to change
an existing smb.conf file.

This option allows sites, OEMs and integrators to configure Samba
to remove the old and insecure SMB1 protocol from their products.

Note that the Samba client libraries still support SMB1 connections
even when Samba is configured as --without-smb1-server. This is
to ensure maximum compatibility with environments containing old
SMB1 servers.
----------------------------------------------------------------------

I want to say a big cowsay:

< THANKS >
  --------
         \   ^__^
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||

to David Mulder from SuSE for writing this code, and to Samba
Team members Ralph Boehme from SerNet and Andrew Bartlett from
Catalyst for reviewing and improving the code changes before
merge.

Cheers,

Jeremy.

