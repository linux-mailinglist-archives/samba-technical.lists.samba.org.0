Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E347938D4AC
	for <lists+samba-technical@lfdr.de>; Sat, 22 May 2021 11:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6Hur745WKK/x7qow9/jiGB3tYXUSwvZYDn81pKT9vl0=; b=P7tlmCaIUktNnGta2vNdwmr29/
	Pv/zBoZ2gnZiHQ+HYbUbIoJh4/FAl8mmdfvF9Yjmw/O9J6zL3kifrrY9UcmFUq5EtX02Kq7QlzNv/
	ABfkEKshnjvtX4pNm7hYDywen08D7SP0FEUGq/mV2Pe7vmU7d9W4EDtBBOCJ58qpm8KaH3lPiakli
	aWBR0jAbaFOSbBZ70BhAbTKY/MvDE51C6y2EByS92Gtjceqhh5hu5FGXIWvujHKM0HM19Fof1FMV/
	5gC1L2tJY9NAES2EznJYADgPgUwWKon3G+eq96YGprCf5nQgP0yYHptbZ8gjNdLfOk/VDVsLVmmFI
	MU/m/ZnA==;
Received: from ip6-localhost ([::1]:44766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkNU7-0033M9-Px; Sat, 22 May 2021 08:59:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47766) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkNU2-0033M0-0u
 for samba-technical@lists.samba.org; Sat, 22 May 2021 08:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=6Hur745WKK/x7qow9/jiGB3tYXUSwvZYDn81pKT9vl0=; b=xk/4Lwdj6dQzG8wB9+36yXD653
 mqaqSzL56IyevAIvifNlrEcH8HTKoNDpaG+p+ifOEem0JgAETGHU1EIxtk4rDrb0NQK+DoggNdC58
 n5I5xnOwjXgxbSnH1lz1+SAdVGt2Wy8lCPAutSZyHD10CzQy9u72olbnOZ5bcbFagUuvamNNkh6mu
 0RvSHurVKmh9AGk+bfw1Wui1S9nuIUgWbZcGaD4XjPgsjcfXMp5x1Ly0UUy3QRsVp+KQ55xJ0LuGT
 HwOK1iB/5TpYmYZ1yTd8XigLkLWTmKJBIrd42pQO4mZgfE+qQxv886bhIXjyaf/ANDPQDh8AAuF9d
 S4QXag+AxP+m0tus62lxVbCNx7LUgQWDAfU1l6pSZxVXQuwIv5fcgtZArPQccbcPYmh57RrU8DbOz
 WgzGePVyZsXgZF9vMLoiUMcIuoYCfPE+DYm2Lzqxi/bUQZizILgXnGaotEIPBLDf1/3tDbUFnQfhC
 BQ4sSArpu0Gxx5SjmXOr9GeU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkNTu-00029g-DH; Sat, 22 May 2021 08:59:39 +0000
Message-ID: <77ee7b67dee04853744324c6deaef393b2c3053e.camel@samba.org>
Subject: Re: #samba-technical:matrix.org
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Sat, 22 May 2021 20:59:32 +1200
In-Reply-To: <1743932.cGlQenkl61@magrathea>
References: <1743932.cGlQenkl61@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-05-20 at 11:26 +0200, Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> because of
> 
> https://boingboing.net/2021/05/19/freenode-irc-staff-quit-after-new-owner-seizes-control.html
> 
> I've created #samba-technical:matrix.org as several Samba Team
> members already 
> use matrix!
> 
> Link: 
> https://matrix.to/#/!SyczwOXNZYFHgFpCaR:matrix.org?via=matrix.org
> 
> 

Thank so much.  I find native matrix rooms much less frustrating than
IRC-bridge to freenode, so I'm hoping we can just move there. 

I'm already seeing more technical discussion on the new matrix channel
than I've seen on IRC for years.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


