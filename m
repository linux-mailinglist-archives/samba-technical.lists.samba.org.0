Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B928176167
	for <lists+samba-technical@lfdr.de>; Mon,  2 Mar 2020 18:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/xduGi7MecDfN+jwCHcvgRSlbk8ZE4f3qy6Us9qfS3c=; b=Iugp20fAC+glMGgtxjL0Lgd7WF
	omZ24nkYzQtPoUZ45wCwa+7U1nU9nYRLNaqyAVQznE80dT+/P6FIkHweP+1Z2eD4w0F28ChbAYG/R
	dMN15QCOEUdEjNV233KU7AicwWjKCeqxkRa7EwiiBB0uqLZToPIbWB2FWfcuPMi9Y90dRm19cPDy6
	P5h1SqtwcF37XearI20dCT2Kr4RsqwYqffRJVYOhI77X+U/9aTs0AUEo0gqaALSZWdY57FCUrQ0vn
	gIPgQoN6tzaP7jU5CgoZ519afXOzJEfUop+OuiRodQI5bQ4BDhGVDI1rdxPkQm9s5nf+sSMHqX7qo
	/U+m43hg==;
Received: from localhost ([::1]:32780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j8p6S-00EYjy-4l; Mon, 02 Mar 2020 17:43:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25900) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j8p6M-00EYjr-8R
 for samba-technical@lists.samba.org; Mon, 02 Mar 2020 17:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/xduGi7MecDfN+jwCHcvgRSlbk8ZE4f3qy6Us9qfS3c=; b=BMUAhAXuFS8Xofo0TcEgYe4sjV
 utbXMJWKR+D18fhgEFZyrMZI72bxE1GWlSJ5gDZwisU2uonSxrpOFIhqjP1nj7Eg80WZDIAjrvFqP
 c2JruS5X7kkylPs0bLMKA+ZsGBsT0a/pjSmobU6xhUGfYp9lmN8iL3BcGVzUaCbl5Anj9Y7Qr62ay
 GzLmWDfe0SGxOtCF/t1xToj7ucdBemvAibHGkaXiozRZ6PgRHd+wpt8yvCieIj5gtPzuZlZPM0SMH
 wBm0yljSRjx+l+77TEvndiXn83xCMZIu3ZtGoRlZBOIi48owokxCTq6jCeuDvv6/N6NOOMSfXv9qS
 v9E4fhv/BCwtzExKM59ZjJ3ZPi+FXOz7OqwlAFgUyEkfzSPvFjn+FA9iYM6CRg9HA63+3BqbjoPXM
 9JfInfTNiQgh5wGTdJ63/wp/3Q7/nxYxopYgFNddfb86g47fgLFk+biLNczBZDobwgAvxn4El0t8c
 wFpkfcXXru4uqAuwqUQYK8eC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j8p6K-00080N-2H; Mon, 02 Mar 2020 17:43:32 +0000
Message-ID: <7ce9976d10ab6c13580bd3713f3c537fc842c091.camel@samba.org>
Subject: Re: Question with compiling 4.12rc2 and ceph.
To: belle@samba.org, samba-technical@lists.samba.org
Date: Tue, 03 Mar 2020 06:43:28 +1300
In-Reply-To: <FA363CC88056472198851E19496FC799@rotterdam.bazuin.nl>
References: <FA363CC88056472198851E19496FC799@rotterdam.bazuin.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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

On Wed, 2020-02-05 at 17:06 +0100, L. van Belle via samba-technical
wrote:
> hai, 
>  
> I have a question, 
> Im working on the 4.12.0rc2  packages for debian buster.
> im having a few problems with these parts in source3/wscript mainly the ceph
> part. 
> 
> 
> I was thinking base on : 
>   --with-libcephfs no longer supported, please use compiler
>   flags instead, e.g. GCC LIBRARY_PATH and C_INCLUDE_PATH''') 
> 
> That this would be correct : 
>   --with-libcephfs=/usr/lib/$(DEB_HOST_MULTIARCH) \  

I think you want --enable-cephfs.

You are building for packages installed in the normal paths on your
host OS, so you shouldn't need to set any other paths.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



