Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE0836B1AF
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 12:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MTAQCwPVB0hur8Aswj3+yvghqnZIEeYELOqzv0vjWIs=; b=UP0rjxd4A5rq+8oiHxia2S/3zG
	Jx/e1uCuHAx8CsUH/SHollO9OzIuarDgBb3C8ZKmJPupCdGPnaFCHeOwjNdSEPovxpktNwPBIuvy7
	YqiqrqltqA9wBOYtlGIBEkLyCXlFnzRY5SSttolpcpgUogBbUDfyaJUqR+ztIKjkNHbzDnf4/OKcP
	C+DsVu8jx4VZU9keNaW3OXrGze33A4AzAm8SVg06DQ1psNjVANVCiR45nmqmCU+zp1jX3y0zu+rL5
	PNgxhPKl26cSaNZCTFd5TR+44n2cBZTXLJRwYGcSNcHMwA/uQcyHwwyWMHihAdf9zJTN+xO+/T796
	VDaI2y3A==;
Received: from ip6-localhost ([::1]:49676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1layYE-00CT6p-L3; Mon, 26 Apr 2021 10:33:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53150) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1layYA-00CT6i-3n
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=MTAQCwPVB0hur8Aswj3+yvghqnZIEeYELOqzv0vjWIs=; b=pid7+wwdDvTb9/jEvMARf14Z9y
 MKhXs1hZbjpO0iY4dE7tnFGeOEIcPqPSDJAcDGWbkJSNMuGk/O3Xc28NMzQGLxEQW3vornuMe5EvL
 15dJID6wx8JuvhiAn7tuWyj89GuzbB+rvfvzCNxN9E8lrbjluMZSNPHbQYx+qbCS6akIYjKdEopA8
 +rwwoApNEaZ8MwQpitClnRnmcYPxfBqod49R2G0wPi+0EqGu9/nQLW+fF3AGCD2KyJ/kyuN4Eehmw
 Y/2bBpxip5OZbM/b85iOeTmkzN2unVFDGLHIlM5vsLP11YsWB/kdkeaZwrz1S7qLUtunlfJCZ1mWr
 LG5SOg7HHYu1tNXypaS4qL/iY0YOaCYHEE+xrUODLeUQE6jivIBYBV6xenOFVoNnlINNkmogkLDqb
 uTBnhI7Q7fmkE+/vVeeEvW6ZICSeFMlBmFO+Y6y7UOMLT2BXUCOAHrBLH2NSJNemJghDejqncUMcd
 NRXUotXcttHrvz/K2GpbDXot;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1layY8-00066r-Ha
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:33:08 +0000
Subject: Re: Ubuntu's ADSys
To: samba-technical@lists.samba.org
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
Message-ID: <a9e82907-faef-ade9-910c-6578987c5d72@samba.org>
Date: Mon, 26 Apr 2021 11:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/04/2021 11:27, Douglas Bagnall via samba-technical wrote:
> I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
> Directory integration":
>
> https://ubuntu.com/blog/ubuntu-21-04-is-here
>
> It looks like this is based on a project called "ADSys" (GPLv3, written in
> Go), that works as a GPO client.
>
> https://github.com/ubuntu/adsys
>
> They use Samba in their tests, as far as I can tell.
>
>
> Douglas
>
>

Well, if they did use Samba, which version of Samba ? I ask because I 
tried 21.04 in a VM against my Samba AD domain and it didn't work. No 
matter what permutation of username I used, I couldn't log in. I found 
out that 'getent' didn't return any AD users.

Rowland



