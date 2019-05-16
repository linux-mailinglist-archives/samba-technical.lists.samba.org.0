Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34581FF46
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 07:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=F2UHeRQtpIfXoo6xT0eVHtHs1SWogZQkCXs0wuAVT14=; b=HapCNxYT7+HajbLjmYoc0M79ff
	OvVBRAmd4rSiDg2rIQSn/H0v9/tAxJk6txcakwv5nd4sp5EOmEwIX6/U8ofX/zPeenuuIUkF+F82H
	T+IDhN17ek2ijLGmzbrUPXgZ2gpYYf52FWiRcMcA3/aMV92Xj0umkqsymnbs+CJ+rk25v+P89F+qd
	tkE2YVn/6v4tS+QS9fLrYtQ9TS0sWSJl2Cwodo2jS4Na0imqdl6OX3Mb1MKgVbazMS2EFKtB2/cqY
	dDvMoBMuVxHNjyfYCuGeBQfBxfHHEA78EGQp3eMTlteE9Eae63Ab7yL15KKpiNyqp/so5F7mGd4Ap
	FzeinYZg==;
Received: from localhost ([::1]:45110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR9Nd-003uPj-8d; Thu, 16 May 2019 05:56:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:46482) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR9NY-003uPc-FX
 for samba-technical@lists.samba.org; Thu, 16 May 2019 05:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=F2UHeRQtpIfXoo6xT0eVHtHs1SWogZQkCXs0wuAVT14=; b=aK4DDmvV4h7zdXJzVrB76RxPBF
 hUwzzSyeaIx+PshG+T39Y5sz1AC4xwaHk5EO6TJkHtYc3jL/EyoHtBVB+TGj5CmML9KDj2uCFIKQg
 f0IWzOoFjG6rxUwZR9pH9XkaZeMRWYZKnR+xNcP3TdUttHrHwyZyK5i0TwLRMHb3R3PU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hR9NX-000663-OG; Thu, 16 May 2019 05:56:31 +0000
Date: Thu, 16 May 2019 07:56:29 +0200
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] lib:util: Fix tfork return value if sigprocmask fails
Message-ID: <20190516055628.7ta65ravwnolyfjx@inti>
References: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CADRDgG5Oh2GfCzrzZzHDhD6nzCqCLgctptdK7-stYqjwsOp96g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 11, 2019 at 09:31:44PM +0200, Rikard Falkeborn via samba-technical wrote:
>Returning a non-zero value from a function with bool as return value is
>the same as returning true. Change the return value to false if
>sigprocmask or pthread_sigmask fails to indicate failure.

thanks Rikard!

Patch is obiously correct. Second team reviewer please?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

