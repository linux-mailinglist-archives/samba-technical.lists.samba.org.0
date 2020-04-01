Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7365619B4B1
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 19:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EM3SFoyY1pX3mIW+nnLYhD5mOTCV72cV1ayuMsrTTus=; b=JkowK7UvFILv6DB0Cp7yPjdpeE
	GtTQwpzgDgv3yV54pZ1R9UExdCK6JcS5lBC7GOgzTQIHYMhZOCHGiFBJavTo0n38IpfPi7n+6f1u+
	/PAG6PYAIvh6OSSzQvzEhyKD5QLFlvN/eLow8cSBCyit+g4mWG4ECk22QsJfxvgjnWYXiFnsDxqxA
	AGvOXoCkaki1DsEg5b5B3dd1Nv2/+sSerc1gqOk1lPaY0KinCWvUqIFfPdpRq1eHOTmIiCm69xYlP
	tL5yhqV7xqCXnhRw3M/Kl0iPaZ80Opv0XdmqdmmaqDeRqOE/zqm2knCSYfy9Nx/yIrgBjYGYnJKzK
	+T5QgIjA==;
Received: from localhost ([::1]:41186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJhD8-0031iU-SB; Wed, 01 Apr 2020 17:31:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJhD4-0031iN-5g
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 17:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=EM3SFoyY1pX3mIW+nnLYhD5mOTCV72cV1ayuMsrTTus=; b=qXzbvnYe5VmW65+TgcjyLKVDsf
 86EtBNxMRurtFpyL/aC3lFSn9mlH0EPwft4A2QhxzVG+FJKov5mmv4Wd2H++RvsfRqzLraMKIsNcS
 Wsdo1F6NwnRBEF7Qn5eN55VK1BIxRg3QYx/9qB4+g2Tp5NPCd89vUWsvdC+Y31BT2ICSm+pMNzopF
 4pxdqUblzbCQsKNAyZWhE5whmLbA4A8pKs4qz8XZO3dpip+dXAtqz6+L3R8Hcct7nSi4O0iFg3o2A
 t2S5Hy+EIXKQPvSPxP3rJhMP1mpAwPjHNUPEMPQFh9MqE05588pEOx7nPVW+uJeHNZis0p4zzASfs
 /n1zHLjeA2c6ttprVIWQM9XIT1cTMxJ28fzViFAW3hoVMS0kzXKjpRGEcb2G5S/2S5scnuPyJzVDe
 Sx+HflfS9Fe7xN5xyjC38zSXypVwL2mXiNRV0/4IRpAQaDriP6vjK4/pFAi11smoyFB2HFlWTtEwU
 IUi33F619RVYTm8p3Te+Zgwp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJhD3-00012r-7W; Wed, 01 Apr 2020 17:31:25 +0000
Date: Wed, 1 Apr 2020 10:31:18 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: A pam_wrapper success story
Message-ID: <20200401173118.GA790@jeremy-acer>
References: <7821886.Ryaapmv3DJ@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7821886.Ryaapmv3DJ@magrathea>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 01, 2020 at 07:01:27PM +0200, Andreas Schneider via samba-technical wrote:
> Bastien started to use pam_wrapper for the PAM fingerprint module and 
> contributed code to cwrap!
> 
> https://www.hadess.net/2020/04/pam-testing-using-pamwrapper-and.html

Very cool Andreas ! Thanks for the link.

