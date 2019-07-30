Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 491DC7B050
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 19:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=b2kXTb6h7GJvp4Tr1jkxf2hhKbqGicvw7pM0HUDdJgQ=; b=gy24fZgSW8ZvueV4QNDjMTp3vx
	4lwGBThExlKq1XpA/srYwL5/aUSPDEflHgs4O2PNSkbYVt19yiMjMMwNO0YtVnuv2FWpsTXUThKE/
	SFrJWRxADGuCEZgZ6R6N7qn6jdtJtvZnnwlff5evisyrCEea2QFZCZr/qnlLsjmnCRM008lSepQ7N
	fFj0f37gM41XLAkFbMlAm3rkqa9MprUOM+UJIbt+hRdtzbfNJJ2oVsdn+lhEfCvCqdhk2xttpOD5K
	ZiVWc64dSYMVB/MMWIcOZx6CNe/n4QgNi8WHOdPPZEVs26iN1CPgy10IS/RLFb+06wuGiRBiMdL8c
	wPERUmgg==;
Received: from localhost ([::1]:41298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsW7J-0013ii-Rw; Tue, 30 Jul 2019 17:40:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsW7F-0013iZ-Rm
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 17:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=b2kXTb6h7GJvp4Tr1jkxf2hhKbqGicvw7pM0HUDdJgQ=; b=ms6cw3pgKca6E3ga/I6Q7DnFLA
 C5WzzPVnzX1B0ZqrHXmzbYoVHAwB1s5PCC8gQt0E4Zv4n0d4WV7UQanyWyte8IAli+jtWtE2yXX9l
 Xmp7PqEEUy0tSWf76csFKPKLwhXG9Iy+YASS1wQKjhLbylcL0V5GJpfs4dHwtVwWPbOQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsW7F-0005Vs-8G; Tue, 30 Jul 2019 17:40:49 +0000
Subject: Re: Interesting issue with Macs accessing SMB shares ...
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPxikKqDFpTF=z7u-xVwxpXSLEoo1wssnYRccYuUt3brfg@mail.gmail.com>
Message-ID: <4f1ad8d7-3df3-c5d1-5b5f-f299b2235ed2@samba.org>
Date: Tue, 30 Jul 2019 19:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPxikKqDFpTF=z7u-xVwxpXSLEoo1wssnYRccYuUt3brfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Richard,

On 7/30/19 7:14 PM, Richard Sharpe via samba-technical wrote:
> UserA accesses/mounts an smb share on \\some-server\some-share and 
> when listing the files in a terminal with 'ls -a' they show up as 
> owned by UserA.
> 
> If UserB also accesses/mounts the same smb share on 
> \\some-server\some-share and does an 'ls -a' they show up as owned
> by UserB.
> 
> 1. Is this normal?
Not 100% sure. With AFP the macOS client has a notion of being in
"domain mode" or not. In the latter mode all files are being shown as
owner by the mounting user. Only in "domain mode" the client will
actually show the real server side ownership.

To be honest, I have no idea if similar rules apply to SMB. :)

Is your client part of the same domain as the server? Or is the server
running in standalone mode?

Cheerio!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

