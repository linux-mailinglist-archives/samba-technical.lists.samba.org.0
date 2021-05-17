Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C6383220
	for <lists+samba-technical@lfdr.de>; Mon, 17 May 2021 16:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FZzV5hD/QK6PnrAB1NUcJtQtbCAxTt/yOkEAZwoYCfs=; b=gc+F27nRHs9aTcCmM5aYrxmg5o
	uNx4ReN/B23YHk0q9UPzMCAUc9aTaCoKgw/dK9OtS21uRlcMUVTPmY9lCnmgy0rdlXuYE7MdKqAZQ
	b2660mp6b93GBh7fnMVuLVm1fh/vRht8jxJWHDRSEgZ5ZgjilrfildZ8ZlUuEHplRu9vhxflh72PC
	dp0HG1jXZmdxhdbrQhc8dhBuI/QIzOyTjfUPEJ9ozPfPzouVZ1a/dviHrSvirGYnGmAcJMzhnqMJZ
	vWUJ4gPCCfgUvTStAzWC+0DsAbHH6xRZol7FahKo/1dAPqpz9y53dnPiGW7rpsXRil6rVBg8aU29B
	+yWWDUCA==;
Received: from ip6-localhost ([::1]:25586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lieWJ-000w3n-Lj; Mon, 17 May 2021 14:46:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lieWB-000w3b-4r
 for samba-technical@lists.samba.org; Mon, 17 May 2021 14:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=FZzV5hD/QK6PnrAB1NUcJtQtbCAxTt/yOkEAZwoYCfs=; b=hoeKpTl0ExzO8FYPM5DEDlkndI
 t+szEdWhXQ3R3eh+xTp9VLXy2D6vvAGMsawTZhoBZ3EWP90QKpRDJxen5FLEki6nGuJAehdIvggk9
 lWgEiIU/4cjhTNQbjktcv56JSxlr8wUVFL3+0Z3AD+39ELv0slKZhXVqQfn5fctoTpeuDGDr4gT9D
 43KKb/azyfpC66B/cjPBGxKmIy1wPDmw/4JtVopntqT80vxCOcGP48zTTLRBv20rcM3PCpU1pHFRD
 95hgV4tV0ligdOfdz/R542VR2mXtqVR1LuuxKO97KkQQuI4tUtAQiOOK1DMYDp5/jyDlxnPZZLggu
 Fdry7Ouotdl55Swd17klq8x/p9r2mc/WC9WcQRtzLXx8ueLIdOf3FxmgmLJP1YLRsi58XjloyfHKd
 6x7VREu1FGtJSCKf4lE4vs038s4h1uTjH0gNM5fcRmi6nK9nSezLl7DhADK0nk1aEEugdU7+YpU5N
 FYJI7gjuuarLWvYB/cogLx8C;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lieWA-0004bP-Jt; Mon, 17 May 2021 14:46:50 +0000
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>,
 samba-technical@lists.samba.org
References: <0b0bb73c-fac8-3072-9609-15028b08936d@itsd.de>
Message-ID: <baf859ec-06b2-f348-b7ad-46eab7602d0c@samba.org>
Date: Mon, 17 May 2021 15:46:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0b0bb73c-fac8-3072-9609-15028b08936d@itsd.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 17/05/2021 15:41, Dr. Hansjörg Maurer via samba-technical wrote:

Sorry, but it is still an empty email and I will not blindly open an 
attachment.

Can you please tell us just what your exact problem is, with as much 
detail as possible.

Rowland



