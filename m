Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D496223333
	for <lists+samba-technical@lfdr.de>; Fri, 17 Jul 2020 07:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4Xq50V34hXCzqI9uDRraHfXiGukvylvRJE1JFVOKifU=; b=r54XV9kbeQM4QGDBorOJasytSi
	4gxbRO3NGP2/cA/qRjJVuI5sCiV5ovQQqRx6x6kqb6R8MVCE6tzpPGbRY5qhmKbIUT4Uqz2k4vGRT
	hTnuvdfo03XxbwZetxTUKfdmmmhxTcSGIqrUvwc1QI7ExAMkJiORsvLLVfcnZ37Fh71lAyL1EJZCE
	qWCFWSd8ARtAPIof+59riFWWX6hy+iHMC0n1aOY0Gl8BfW30rn7iw1poGXqSD8HhpRg8m7s4yKPuj
	nsl45AtSzx1bcOIpQMTc77hD+qHxGTVS9nYjMRohN8gSE7a4IK6Df1uU3dD8PLNzSEh/kJVcYPhq4
	6o/f9H5A==;
Received: from localhost ([::1]:53848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jwJOS-008HyI-7J; Fri, 17 Jul 2020 05:58:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55020) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwJOK-008Hy8-Tg; Fri, 17 Jul 2020 05:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=4Xq50V34hXCzqI9uDRraHfXiGukvylvRJE1JFVOKifU=; b=lxlf85wglG5S/3yv5L4ges5y1o
 0I8DnjBMjUJrhick3uIb7/sIB26Jt/wBHIigkfDN0NWkWOtpFovVUsQ+/CYltE3PrsELg93n1BRXS
 vcL9fTiX1LkoyhaYCm5DjR2++Tw0FAUcSlHqLKh4K+KyWXrhssLi9k9N7P/VuNOZpqLf9gugI7Y0I
 xeBEEFg/vrG1AUU1YBQrOAmb3ENI/7el4JaA8SNvPy7/1uva7MYCyYglMLSjfqTsEJJ9DoZ4uztJs
 j8K1T83WfOeuZIC9bnaopKtgeBIj8mNVSxJqxTLTti4KBlQn4c933WjFJxSHLDvALa4czwx4hcIrQ
 E6hNuAc9hN6HRklqXcVa5OSEiE6D0lOkLQWqTxC7eq+4lHdASX0u7j6i8BhiD2fYrVh+2250hhoAd
 Vt/HDDXs1pfI68xWXSexJBlxgTooEeED6c1tlz/Z3GxK7OsA4XA70m4hES7TSU+fjqKEkaVTj1JS5
 G6WWUkIaggSAiddTCd677luW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwJOJ-0006MV-H5; Fri, 17 Jul 2020 05:58:39 +0000
To: samba-technical@lists.samba.org, metze@samba.org, slow@samba.org,
 samba-team@lists.samba.org, Jeremy Allison <jra@samba.org>
Subject: Re: Problematic port field in struct ip_service in Samba.
Date: Fri, 17 Jul 2020 07:58:38 +0200
Message-ID: <19699373.5neafNTYPK@magrathea>
In-Reply-To: <20200716222600.GC6574@jeremy-acer>
References: <20200716222600.GC6574@jeremy-acer>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Friday, 17 July 2020 00:26:00 CEST Jeremy Allison via samba-team wrote:
> Hi Team & all interested parties,

Hi Jeremy,

> Eventually I'd like to replace all
> uses of struct ip_service -> struct sockaddr_storage,
> but that's a bigger cleanup for another
> day.. :-).

we actually should replace this with `struct samba_sockaddr`
to avoid strict aliasing issues!

See lib/util/util_net.h for `struct samba_sockaddr`

and

https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/master-strict-aliasing

I've just recently had to fix a crash on arm in nss_wrapper which was caused 
by not following strict aliasing rules:

https://gitlab.com/cwrap/nss_wrapper/-/commit/
6ec14bb96f0e0447132472910657569f1188149b


Best regards,


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



