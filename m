Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAD9D274E
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2024 14:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=WWewjPXWl4LyDwPzwUDK3CGBxG8uOQ1Pc7X57bqOlUg=; b=QiZ+hOZl+0+QyfXNEbGMLBHYs5
	fhuqFfY1CUQv5t0t1UfFS5wUtr11aOGxa03KxDigLsSZwmqHYjzqe8+8SW3WA+6aW/w804ry+FhXM
	n2RrHBe8yP9fl4ysOrW52Y0PzagfRHLGVt6KYHwgSIwwad3uFq0iAXM1+noo/YbLNyT3nF66WAbh0
	K8OMkPT/K7RoPCiIcy03D02bBXztTg4XcM2MZ5+7CVDK0BCNwLhscjECxyKk0cwGyHrCAOzRi2dil
	37rxU53XLxgdELZgxYzkVnG10GtTwP/cmrpT7A/GJDOFzfGlemoj2RRTMSktNBP8Zg9xznSuzgDLu
	k4sLYlNw==;
Received: from ip6-localhost ([::1]:24840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tDOd7-000Eck-1t; Tue, 19 Nov 2024 13:50:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDOd2-000Ecd-PG
 for samba-technical@lists.samba.org; Tue, 19 Nov 2024 13:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=WWewjPXWl4LyDwPzwUDK3CGBxG8uOQ1Pc7X57bqOlUg=; b=1srNRWbJHL6nhu+jEKJXpJacKX
 LcLHSI8oDa5rNQ+eeK2WogZZTetG7wsFwObZV859tC55gEcBi7LF5p1CARyZreXynthggebkNZZgY
 cAcqtoRhJtLsT3A/P3tFehfQ+Hz0fUqQBdfFWApRxnlmTDMzwDKN+jUTJQPAtNS/G8G+8BN1vNsDj
 oHoNjCKFKmPW126D9KBhssDuxGHsUy/Pb+J635FBs7b2lP6Bd5vtkK1NGnWCfE9vX+zO6jfaF/g71
 gdMYB1FSTV8OB6N5cWVZoMdnM+KjdrmIgrC84Sv0YvMLXDd1KXZKFe9sLX6F6q1McdpflekOe9/ef
 DczhPznHdMf6tS3Hn0UGQES1rCPDmscaRqZvEXS3lZvEttLLjb0jC8lqJhPJOv5cEFrY87yPiwn20
 9YNiBy604FsRkYOQ0r1d2CvawwnOfB6vApPwZPIXjzRP+7B9g31aohkzRLRfyEztQPtj66D7kjx1d
 ujzj+vybMgNWBNCwQER3ebKt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDOd1-000VK3-29 for samba-technical@lists.samba.org;
 Tue, 19 Nov 2024 13:50:51 +0000
To: samba-technical@lists.samba.org
Subject: Post NTLM
Date: Tue, 19 Nov 2024 14:50:50 +0100
Message-ID: <5865680.rdbgypaU67@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I don't know if you saw the talks from Alexander and/or Alexander and me, but 
we work on Post NTLM.

You might wonder what what will replace NTLM. It wont really be replaced, 
instead Kerberos will be used, which is already there. However Kerberos needs 
to support a protocol extension called IAKerb and Samba too.

For IAKerb you want a local KDC which is really only running locally on the 
server. If the client and server can speak IAKerb, you can use the local KDC 
to authenticate using a local user on the server.

Alexander and I have implemented unix domain socket support in MIT Kerberos 
and also socket activation [1]. This is still work in progress.

I have an IAKerb prototype implementation for Samba [2] too. If you combine 
the two, you can connect using smbclient using the local user UPN on the Samba 
server. The client will get a krbtgt and a service ticket over SMB connection 
and use it to authenticate with smbd.

Screencast:

https://mastodon.social/@cryptomilk/113509793719969898


Cheers

	Andreas


[1] https://github.com/krb5/krb5/pull/1359
[2] https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-iakerb

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



