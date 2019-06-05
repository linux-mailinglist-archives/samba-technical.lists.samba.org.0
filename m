Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA336214
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2019 19:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mH/xzqbqphTIGAeWS8Aj3JrxHniWl2u+whdlheNa4mY=; b=N5oFBLKcjSqwi0qptUBJvPaF7b
	y5S7P9E9bd5f7JXhT0c+t7EY7rayzcJDIiVfSTgUL9moOBXK9/PndKHX1hOcyeKMJBzKSCMDiLRU1
	Q8z+PGNkacAiXuY8J/jvwlQLbeAtNZLAnnjMJPei3qPW1yKm+fB5zDOw+qiXpmx/CibK0s6SVPfoZ
	2/BqTevAzZsHiztQ3arSLAO1Na+yy3lxWSkbmksbvqEc0hqguWHajowPZ0b+uPFDI+cee8rhGJo0+
	iWVJFX/W4yIWUZumYUJCKffslp4dGlMWNU8R/R0j2uod/Bk6re0Yt3RFP4bA62XLPveDVc3C7GmSK
	HQJFrcuA==;
Received: from localhost ([::1]:36376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYZN7-0007Hw-8B; Wed, 05 Jun 2019 17:06:45 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hYZN2-0007Hp-SD
 for samba-technical@lists.samba.org; Wed, 05 Jun 2019 17:06:43 +0000
Received: by mail-qt1-f193.google.com with SMTP id u12so1493168qth.3
 for <samba-technical@lists.samba.org>; Wed, 05 Jun 2019 10:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mH/xzqbqphTIGAeWS8Aj3JrxHniWl2u+whdlheNa4mY=;
 b=GXe9T+Wef6YSNN9GLCotlhHew2Tkhuc01ZVlzQ7H7Ayd6PcW0yth77JW7DCRGxiPlM
 Pg1eNgLxYZR1A2vlXHb9pfHOwgPzmVLgrJbJgEO2I30IlMUi6bQAvVwm0a3lLRKmNkgy
 amcX9a89cUajcGZEZQz84qSJaUnTdbN14oGJ6dEJITBz/FGcN9pPsKN6UdMLWm/WVQTm
 MmGCgaVJgt0TTc22y9KGv5uWU6D0Lg/2q4II0Qe0FQX5+FBQuDjr/SzrEgKup2pzyYwM
 3+bwmUTRirLgukoUvDLj8H7M+9V+bzpTkbDulMZdPufMtB3+uUYrILlgbKGC6yqvP7jE
 9joA==
X-Gm-Message-State: APjAAAUg/x9tcaozpaBpw8JUs7EB/Nm9HZfWZWCnz5krYiWW+o9O3+vk
 JL2ST2l92Nk+uRpIIHaShtOAPxOJGsg=
X-Google-Smtp-Source: APXvYqyybK7hKQPRgIoCHJLPIlFHjKv91PTZPxFevDbPcXr912iI1HoeObUXudOS1qgLNiMgeczIzQ==
X-Received: by 2002:ac8:6b95:: with SMTP id z21mr34632354qts.337.1559754396711; 
 Wed, 05 Jun 2019 10:06:36 -0700 (PDT)
Received: from [10.8.8.39] ([185.153.176.13])
 by smtp.gmail.com with ESMTPSA id w16sm10701723qtc.41.2019.06.05.10.06.35
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 10:06:36 -0700 (PDT)
Subject: Re: [PATCH] ctdb-scripts: Fix ss syntax in update_tickles()
To: samba-technical@lists.samba.org
References: <20190604014400.16289-1-rafaeldtinoco@ubuntu.com>
Openpgp: preference=signencrypt
Message-ID: <231d882d-8a4b-161c-8af2-a4f179047989@ubuntu.com>
Date: Wed, 5 Jun 2019 14:06:33 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604014400.16289-1-rafaeldtinoco@ubuntu.com>
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
From: Rafael David Tinoco via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 03/06/2019 22:44, Rafael David Tinoco wrote:
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=13985
> 
> During CTDB execution I got the following error:
> 
> ctdbd[1000]: Starting traverse on DB ctdb.tdb (id 806)
> ctdbd[1000]: Ending traverse on DB ctdb.tdb (id 806), records 0
> ctdb-eventd[1002]: 60.nfq: ss: bison bellows (while parsing filter): "syntax error!" Sorry.
> ctdb-eventd[1002]: 60.nfs: Usage: ss [ OPTIONS ]
> ctdb-eventd[1002]: 60.nfs:        ss [ OPTIONS ] [ FILTER ]
> ctdb-eventd[1002]: 60.nfs:    -V, --version       output version information
> 
Please ignore this patch.

Issue discussed with Martin (tks a lot) and explained in here:

https://bugzilla.samba.org/show_bug.cgi?id=13985#c7

iproute2 being fixed in Ubuntu Cosmic, Disco and Eoan.

Sorry for the noise.

Rafael
--
Rafael D. Tinoco

