Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 997572ACC9
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 03:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=v4Jj9+SKcFkr1MLnSvkbFBN3jXyK+u+h8qGa3W5S850=; b=WQv86l0sdwHLYrCUOsSIQRNQou
	4C/Tn508VBiqlrWHkGUxVSx8CUFaxlqnU6HzvB1bZSfQvr+a4ZSXdnx415nIie6VKG+jG9Dl6XxJL
	4ahYECQfjRbWF3Mhm3GDi+Dz+p0W65NXowaYvi2xq75RQCnOdPW6UXTCrjbhBzJ5Wsi5BH35zMkaU
	BRa5DG4Im3aK//BA+R0AGjnYdKf4CVM5pQ15UkobAJsZi5hvSpESbqJJR+3fvWDTW1PDZSO3Zul69
	aNMcuW8fE71bAgk7hCgYjqlpVwG5/Np88tFXFN4Ry1uSRYPklwl1XVH7KiHLHmlg5jcbSTCC64KjV
	GXgAnyqw==;
Received: from localhost ([::1]:25524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hV4RG-0023lb-8W; Mon, 27 May 2019 01:28:34 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:50592) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hV4R3-0023lU-RC
 for samba-technical@lists.samba.org; Mon, 27 May 2019 01:28:27 +0000
Received: from [10.60.67.187] (unknown [203.97.87.169])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 828B6810E7; 
 Mon, 27 May 2019 13:28:11 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558920492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4Jj9+SKcFkr1MLnSvkbFBN3jXyK+u+h8qGa3W5S850=;
 b=iMTMDgx49d7I4Annrk9zJYcIfrlPr/pzZ/QqmbI58+CiWx5CW/F/GuRquwy1AJWK7ZCV6p
 qbmm6Tu8OXxjg0xIeeNlbKP5EjrjkOKV8bo3+5MyvjkIaUl/rINYPWK4wRcv2riIfV8A9a
 sClUifOmzCB6nnZAcEMCadjT5nDcLhCog80s8vWaiXA8O5HKx7S40Ujf1GYahitItyD/C5
 pllYZVLVyka4N7CBnvf7GB3zVp5dLBfQGPPx3IsC623H/fLaVWrFOsk2IrkCogIIRqcSNZ
 QwrP3+M4cvp8q8P8/WGIld2ph+j/CNkxHAB7EUZjAhPHgDvCaNPpNqQjra4tZA==
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org,
 =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
Message-ID: <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
Date: Mon, 27 May 2019 13:28:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558920492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4Jj9+SKcFkr1MLnSvkbFBN3jXyK+u+h8qGa3W5S850=;
 b=Zw1xZUl/AKM/lKXEYj+dEhsHKSflKRPg2FY8EB+NqxIXTHI52ZjDtVKkRpNmnG5OfZfXse
 N7Kl9H1P3MOldjJ98Fhwei2t45Lm3rjygnrbEZXL9ymd9fNdMXTJALMXc06ozU90g/8IdO
 WsSJOM37ETHI29Mkm2+HoKPybKqZKrKWs1cn95mE/WA5NXjuLZHe1lFDkH1awy/1hyUiqV
 MLvLIrowFYj6FFLXWU2Yn1LeymPUL5SKQzssNPIeBn3BwkoOf9GV79OBkKDDXSYZFu7dLg
 6LYyZJhwbzNU8CRUskqmIH+lJV0Y3IKbUisj7vhU0obv+WjxZ6MjUbRN8/L59g==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1558920492; a=rsa-sha256;
 cv=none;
 b=jcHZey9vDftmYnOov2oCcs38MHWgb63NXpvBJD6Y4LE1wCDCgYOg5GMtz1hUxkPfEQHsbx
 Dx1eJBWacvr37PldnhVkymZnktGjIlx6yyEFIEYJogPLmooRB/gzLu9u8bQoeOnDHSLQoq
 lHVittR+hWw0bG49GglaqtZ17lepi1XN6Qp/WkeYvBDEIrfvgW9XaJ29uVmnvz+qGorCpe
 F4k0crt3cwWDnL3T150LIFDXjeBcQqaLhf5bmyMHk86Pl+rIbpmYekm5wqK7s5W7NoCffY
 bmodAm33V1Syg5jOO42T/44G5uwVhAsd1Ywizrz116xcntJPkVGx4HeTOeonsA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 26/05/19 11:22 PM, Rowland penny wrote:

>
> How do you test for something that works on some computers, but not on
> others ?

With Gitlab CI.

> Which is correct, it working, or it not working ?

Well, when I go

PYTHONPATH=bin/python python3 -c 'import samba; samba.drs_utils.drsException'

I get "module 'samba' has no attribute 'drs_utils'".

Maybe Python 2 was different.

> If you have a problem with the test, take it up with Andrew, I initially
> created the script following his advice, he later 'improved' it, obviously
> not enough ;-)

Yes. It only tests 'samba-tool fsmo show', not 'seize' and 'transfer'.

> Anyway, NACK to your patch, but only because you haven't remove the
> 'import samba' line.

OK, though I don't it would work with the line removed.
For example, it would break

        forest_dn = samba.dn_from_dns_name(samdb.forest_dns_name())

and it *might* break other things too because, as discussed, Python
imports can be a bit weird with unexpected side-effects.

cheers,
Douglas

