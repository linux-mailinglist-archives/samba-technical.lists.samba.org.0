Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58775579D6
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 05:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=djoLGRGgG+wobNwYXuSh3knRIdd6ZGh+bVriE9nMPxA=; b=dmHH3ncx+KW47SB0C4NgR/3pRc
	Z1TwRVHY/a343LUt0lDxzm/9Pc8H0UNA9g5EXOtk+6mKQgrY0t2LyRn/oZS0B+m8ba/gTc/RFYUD0
	shJL8tjBa/9nan1qD7JgKkPGnYfVmtOqgrV9E3sLi85d1fNELI+NvNWVpeXdzCyJ4ryNbdzPeVBpA
	izrGVwNU0tvpeb/vXwPEyLa1fmkEGHf5Up8YTikJ1aNdM52S6SjjcNJM6YwQb5Z2P7TG/CdllYa2O
	PFIGrLGC8NCilbYLkqEk4HgZlJAK6XakZAxI78VPyfVcK1I0EwApL7CrQuGk7PIcmHBDFWMY8oHWm
	cDKqhnFw==;
Received: from localhost ([::1]:38438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgKk2-0023ZP-8T; Thu, 27 Jun 2019 03:06:30 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:48008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgKjw-0023ZI-13
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 03:06:28 +0000
Received: from [IPv6:2404:130:0:1000:b58e:701b:534d:7f42] (unknown
 [IPv6:2404:130:0:1000:b58e:701b:534d:7f42])
 (Authenticated sender: garming@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id CC6D980F7B; 
 Thu, 27 Jun 2019 15:06:11 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561604771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=djoLGRGgG+wobNwYXuSh3knRIdd6ZGh+bVriE9nMPxA=;
 b=sAuDCGNo7Zx9JxjK1pvDwb6NjhB7g5Hr9dfmAvxwwNgqMbPyGIP7AKOCy+7RFYoYDAXeLc
 UYPxLYepwtA1Lnyzz9VImFxloqpFjk/6qxVmBa3cqVJ7ywI4/oVVv1qFqnqS0DpvDNs3rf
 qHBKgtBvfhBkYwviMVlCrXqvKrXPikcIp16HE7IKp3Y7RVG6V9nYQtu6s1mce8VsO6kFak
 /OJR4jyGjvBdu2Q+grx38BLglTQmm+kStRSoGajVmRIGBrqJwcdYDvA1IM0aYuGkeuivXr
 qRGVLK1PJdPOc5FjWkvIZFt0hDM3GLWjiZwlX3NvqDylLvYuGRf/6tE32PKkag==
Subject: Re: [Samba] sysvolreset optimization
To: Simon FONTENEAU <sfonteneau@tranquil.it>
References: <b1bdc957-947f-57b7-9513-54114dc31ffd@tranquil.it>
Openpgp: preference=signencrypt
Message-ID: <5b5dbf6a-7525-2b3d-cc9a-52e36f15fc59@catalyst.net.nz>
Date: Thu, 27 Jun 2019 15:06:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b1bdc957-947f-57b7-9513-54114dc31ffd@tranquil.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561604772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=djoLGRGgG+wobNwYXuSh3knRIdd6ZGh+bVriE9nMPxA=;
 b=A9qrDFpdPPq3K2EYZWQJJH26jxOSzURj9HR6BTEibGWPUvFVGphtMXxUlkBc1T1lEMOX2i
 oDbfansEmSMFLDwVJGZK/cBd6GHp//h3lgGESGBykbuDWGyKG0Gn7eQS4520kjpudlNl4W
 8YYs4RcoxboemU/imMFzhlEL9nZZktmqcsgPKKtc5xxMWaj28oyWCY9t4FBfJ9/cNcs/Jh
 54Ck2MlECkzp+CLr6/rJAYNdlyz0QIgY2WA8gYkk6sfA2t2NguseO/3F1QudBxhvPv6JUS
 sN8II37j1xyZ+fIH8psvTA6oijcM+fhvqA+NRKy1Dq8QlHkgu0oT+UK0Hgzb1g==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1561604772; a=rsa-sha256;
 cv=none;
 b=MCzHSTbaqPLXCSa8KKidGrEvgWV+NRFlTS1ir1om3Qd+UFw3S+dJwho7hP0mXQg311FdmM
 9CZfprrmVeDO8I0IhkruB31/Hk3/M7S123/PQ/zsLgZ/AOABMN5rKi3pjYZYqSjVIcbLMv
 5jkRx6gF2rhTzg4R4mBaWfvJjVBn3A5TsWBelcbVqJ0uCIYN+H3Y+9P4YeDvm8uu19Svdk
 o31rg56pGq9QFQAo3EK6gHPPXmBBk3xE3BpoL0zwNfundDJNDB/DYUUpUf2FFZtPdvCyc7
 ycoIUD0iObIaprn7a0/n7kqhGYrSOnKNWXMCIvDo78Nyl+N+DlBwDsilLefCWA==
ARC-Authentication-Results: i=1; cat-porwal-prod-mail1.catalyst.net.nz;
 auth=pass smtp.auth=garming@catalyst.net.nz
 smtp.mailfrom=garming@catalyst.net.nz
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
From: Garming Sam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Garming Sam <garming@catalyst.net.nz>
Cc: yalemu <yalemu@tranquil.it>,
 samba-technical <samba-technical@lists.samba.org>,
 Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Simon,

I was wondering where you were at with this change. The idea is good,
but to upstream, I think we need to make sure it's still possible to
perform the original behaviour with an option like, --force. The other
possible change to sysvolreset I think was suggested was to take a
subdirectory argument and to only recurse from there. That could be
separate though.

Normally, developer discussion like this appears on the samba-technical
mailing list (which I've now cc'd), but lots of it has also moved to
Gitlab merge requests. I should have just added you to the CI repo, so
you can run the tests that way (and maybe create a pull request).

https://wiki.samba.org/index.php/Samba_CI_on_gitlab

If you have any other questions, just ask.

Cheers,

Garming

On 24/05/19 9:25 PM, Simon FONTENEAU via samba wrote:
> Hello
>
> I'm trying to improve the performance of "samba-tool ntacl
> sysvolreset" on samba.
> Indeed I have a lot of gpo and over 10 000 files in the sysvol.
>
> After some diagnosis I found why the "samba-tool ntacl sysvolreset" is
> slow.
> The problem is in samba/ntacls.py in the setntacl function, the call
> to smbd.set_nt_ac is too slow.
>
> I would like to make sure that in the setntacl function, the call to
> smbd.set_nt_acl is done only if rights need to be reset, so to save time.
>
> I would like to do something like this at the end of the function:
>
> if getntacl (lp, file, None, None, direct_db_access = False, service =
> None) .as_sddl(sid) == sd.as_sddl(sid):
>     return
>
>
> But I can not get getntacl to work correctly in the ntacls.py file
>
> Do you think my suggested method could work ?
>
> Simon
>
>

