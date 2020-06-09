Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7221F378C
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 12:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bOECFy3IJslH6Nv7x4Ty3qnKweFxGnS/el2BqVotFio=; b=Ssclyf21qdmOZbqIZWGKtidnVO
	Obzw3YLd08sB9f3LJNepIo3zhLXEylOu8RtFMQFo75307FuUOS4PfGmdHQLLIMnReB7cTJUFpOZPH
	Z7JNQO7WWKFh25B6OdMCfKcfDkzZB2egpRcZC7YXOzAWMiGAYKntZj2mlsJpxwkkWXlpnMYeokFgP
	2iSjMoOl4hS4xYAM6drvZEP1FCnQ0HGyns4j4ImMy4dapGJY7PIVGnCKe2BYP6fdI+xTtOgo1BjI4
	F6at7xcxBWVLQCXHfrd6gc5QVsCa3YHXg5XaG24nX7SCyTmKGW21HxnsyZJtJk1AMWOY8ADZa0JVK
	qG9HVvuA==;
Received: from localhost ([::1]:36008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jib6N-009b2f-4m; Tue, 09 Jun 2020 10:03:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30232) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jib6F-009b2Y-Sa
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 10:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=bOECFy3IJslH6Nv7x4Ty3qnKweFxGnS/el2BqVotFio=; b=bph/IPThcfLiexoIj7sOcOMpD9
 eJc+Y+mdDzSiRKBFlj/oDstFeNflYhoRP/iHo3Jza3iHTE3CCnI511bXLZ8QTMQKM6WzAkpDXcxh2
 +6we+hT2kf7a3D6ub9cBUHfahaUNvruhX4Kh+rLyt1+O/uF3oRsnVK5F2FWDgHxEmgNM2RJt45z52
 M/zL+E3gKaZ8f0fOdb9WKyCXeCEY8UCSO29MrLkg2E/TVQ4mBmdNckjMkGEAcdAIyN0HsZCV4/Fm1
 OIMtDMb9uh7YVS7XYnOewDCX/xapAdtRltxSigUjq9qu+5eYzYIbcWWDiNWX5smvu4c8N9kKSnuFV
 iMYbwekXBc/k+PYBoERr5TF4D9cohjVc1cT7j3pGKUKI9gF0bElL2qyNp8/IWQVUIpu/B3wgrTJgz
 1CNT4CPJ/4yYlyhJmeTTlaYbZbmEJTVSclTKvH/KaXi/9HjHrQ6alHB06DUttIPG1qwPNAba3QB/t
 S+uyHufaET4WLcDqIiWC9EXZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jib6E-0001XE-WF
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 10:03:19 +0000
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: samba-technical@lists.samba.org
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
 <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
 <2096111bb99eef34a4dccb059ed6eac23ac4ef87.camel@samba.org>
 <6ec67eb9-96ab-3eac-faba-b50bff8656a8@samba.org>
Message-ID: <6a8d2885-9db6-9187-6321-a3fdb554871b@samba.org>
Date: Tue, 9 Jun 2020 11:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6ec67eb9-96ab-3eac-faba-b50bff8656a8@samba.org>
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

On 09/06/2020 10:53, Ralph Boehme via samba-technical wrote:
> Am 6/9/20 um 11:15 AM schrieb Andrew Bartlett via samba-technical:
>> I'm sorry, I still hold to my disagreement.
>>
>> It is really important to understand that while this will fix bugs, I
>> don't see this as a bug fix.  This is a lift-and-shift.  These
>> operations are both delicate and risky.  They also often fix bugs and
>> introduce important new features.
>>
>> But this change needs to be evaluated at that, fully aware of the
>> implications, not just passed in as a bug fix.
>>
>> I've been involved in implementing and in particular reviewing a large
>> number of lift-and-shift operations in Samba.  Rarely are they as
>> simple as they appear, and this one has the added complexity in what
>> I've raised about the target.
>>
>> Therefore this cannot be simple regarded as a 'bug fix'.  I'm very
>> sorry.
>>
>> Furthermore I've been told that this is actually the culmination of a
>> significant amount of work over a period of months or even a year.  I'm
>> incredibly sad that this work got to this late stage before public
>> discussions allowed these issues became apparent.
>>
>> That is awful for everyone, and for that I'm sorry.
> I'm sorry, but to me this looks like the better is the enemy of the
> good. Replacing libads with the existing and already used tldap library
> is a step in the right direction.
>
> -slow
>
Hi, can I ask a few questions here ? What, if anything,  will change 
from the users point of view if libads is changed for the tldap library 
? Will a user notice, will everything work as before, will the user 
experience be better or worse ?

Rowland



