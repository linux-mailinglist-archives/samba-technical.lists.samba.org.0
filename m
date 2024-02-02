Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E584777E
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 19:32:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EKUJfFJirC9v5af3k3/9o4gJZ+Wpt7fs3WlA5npVqho=; b=Hi/d3wjByVkbRajADI1kaA4W6a
	sMCZ3If8THpUKlYWOcrgq0NdnOm2vL+wtV7DuKKqUlLTDkl8pjw8TQPTFr7RBGafpLafsD04XjhHP
	xU1NHWCERx546KXJ5n9/JvsSNnFP0iOqiLEuS7xGpuliGQaXM+rzec+bEgui5SPr8RvYKzje/2TCf
	nmY+EMl+EJI2BshXb8PL2I8ejbIJ2Rz9jrtgN8IU4AUtyHzGX52wkUb+GVEmbjasofS9Mj2ybEKKn
	6j1FtGbJP3Os8A6sut53sK9t6w6+LDX3gD2kfK1ZTufFZ+so9wa6C4S52wcYO+zurPJ4CRq0KFDRz
	1N1fLtUg==;
Received: from ip6-localhost ([::1]:53534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVyKK-007N64-5E; Fri, 02 Feb 2024 18:31:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31420) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVyKF-007N5w-Ny
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 18:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=EKUJfFJirC9v5af3k3/9o4gJZ+Wpt7fs3WlA5npVqho=; b=wX21Ie1ZnJLjddwwzxgGRLJ5Sa
 NESWxHpo4g0nf1zrJuCzH4wdswi+cLKJSNBpE2YyPi+cIX99NVFeH+Q6/oPXzyOzV29h+ofqDFVyz
 4Q0YgiwghLmEM+P5GJHZBmRucjcQS/JOO/MVOiZrUm/FmS4YotW2pyx8IR4viDddm/3v5yU+c2NzR
 Jygp9CD93kC0VFItEfOB8IcLj8+c9xv48rI1YMTXWFKP0B9c6EF0ZTcmjQgPaEBADiQxIbjSQLdM6
 +QHnqzw5bCHoDsr4c1xX8hQEosbHeK+k6Pn0JEqYa0LoHA7ZCKJ3Va9QdZQ8TIUDgkPVPNgSH1hCM
 tdKSgIv32e27cqk4Y3q1JyfLt3+vggnLxyalzVYWwymHA8H2GBqIQ+b1LUmTT3IHXqhqaIgeSuwam
 Tp6jh2W465aDxjoT+I+Qb7xa+Yu0ykVP16I4BY5K2/lfs0+9+PzLLrLPwvLIs0Zv3fT2w5MDTmV3B
 p/XVK4lqWHIFTECM/9I2nox9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVyKE-00BEMW-1k; Fri, 02 Feb 2024 18:31:42 +0000
Date: Fri, 2 Feb 2024 10:31:39 -0800
To: lukaro <lists@lrose.de>
Subject: Re: State of unix extensions and symlink support
Message-ID: <Zb01CxzbEjkEmneU@jeremy-HP-Z840-Workstation>
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
 <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
 <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
 <Zbv6YVRRuyluQM3i@jeremy-HP-Z840-Workstation>
 <b978bca2-947d-4f66-851c-9db0ee4def57@gmail.com>
 <CC41138D-0486-49FF-AB92-FEFE4CE68935@lrose.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CC41138D-0486-49FF-AB92-FEFE4CE68935@lrose.de>
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
Cc: Kees van Vloten <keesvanvloten@gmail.com>,
 Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 02, 2024 at 06:58:13PM +0100, lukaro via samba-technical wrote:
>Thanks for your replies. I have already heard of security concerns, but unfortunately I didn't understand these yet. If the symlinks are created as symlinks on the server and also returned to the client as symlinks, the client can't access any files it doesn't have access to, even if these are referenced by symlinks. Or am I missing something?

https://www.youtube.com/watch?v=8BvA7AqAY10
https://www.youtube.com/watch?v=2BiE7zXdjzY

