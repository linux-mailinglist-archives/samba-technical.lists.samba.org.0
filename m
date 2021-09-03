Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C70174007E3
	for <lists+samba-technical@lfdr.de>; Sat,  4 Sep 2021 00:22:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JeFy/Pg26N8vc77hhD/qGVNlh9IcWUdhcHJmmMbiTHo=; b=6EqCNj6zZIznqes+I/15n8Y72N
	jwx16HFueKc/UGBMfo5HjmxpfJN6+IMxRXGwdSbE5jYw7DxyPT5XHo973u+2fw5YEh93vCLy9p8Ia
	IN36koA9r3SYZFFlUexJRPN+Xl+IlK/t0Lu9vJpeml1CUhxBLQlt9rGIL4TqyWxSxCvME/Ri95Lze
	0+S0iSKWLaiRLMgamLCm1PP+DHjcQbsN6K9pvCx1NIXobMV57/RhEACot9XyAs5vCpF4jE6SFV6W0
	MHhlud96pOXROFY5GEqd5PJtgEbTYVvf4qzBq42r8aaZ3oWa5c/ON6nlGQk0lGiZ+YRZemxPJ91Y+
	T5UHZY8A==;
Received: from ip6-localhost ([::1]:58470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMHYr-00DEnz-JG; Fri, 03 Sep 2021 22:21:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMHYj-00DEnq-0i
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 22:21:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 7so576689pfl.10
 for <samba-technical@lists.samba.org>; Fri, 03 Sep 2021 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=JeFy/Pg26N8vc77hhD/qGVNlh9IcWUdhcHJmmMbiTHo=;
 b=i628oE2TEgx/MYTOmo3zfc9SjPpKlQ2Q6Zf7R3dAjNa5z0hM27mkYhHSPIPD55sAH8
 Pqx43fdTuIw65KHjgW30wT7wnJZ2WGrMn/znxK1QWtfIGgigxW7dJ6tt2qY14VUDEZua
 Oz1Dd1D3Wo+yTyhBQ0B0edx+/7ruGqLAURGzJb6td9PsDr6jWtY6aDniaMmgDZImIpjg
 Q9dfu8GCEr0qrFX6R9usl1UE9jH1ftnyhByjnYzqMFAcJTl7D4/pvSCzvY+s1iqfaV/b
 skMAp6usvqx7YB2SlQm24dg308enVBl2NjyEcErqbJfLvCKzbFaWHg7zhr7wQxpZNJXX
 3nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JeFy/Pg26N8vc77hhD/qGVNlh9IcWUdhcHJmmMbiTHo=;
 b=GC8whXFk5T96bmwV0qxwsgCSu60pmxDNIaOY/l6LTO0sq94MSrXkPVd6VXitvOJgy6
 p0RYd0CfZvmsG/t1vKF1wCQ9ZuVPaZ4iKSCOP7Zb4VcNxUQ0peiMPOmKFf+rs9PQVzta
 jrUQMTk5itjWbThNDq4/eaGsZ5gXoEAqZrMTInJ3WpcnLx2ET1+XOMZeoplJJgejJbcV
 RPnBKjHQypzvspeVFzBUumCyn5dmuCSJZp+8KRDHvaU1Nv6C0jpb0r0M0Q+Cvd5cDu2H
 OVg4yCOOCFWBg4vkMTAj8bxE8ob0iPkazgsKuDkwAz6BzUaHdwLAMzBbamEq7PuXzdP7
 83aA==
X-Gm-Message-State: AOAM533Y6XqT8adiKhXZIIMvAMlGdPgyd5QPjkIztOJT1om7wNVo3J0d
 DkDZqh5w7qxFkKcmVvpFfA3/P5G6nPpOBA==
X-Google-Smtp-Source: ABdhPJy+MbbWLOKVIHBaIrF6ZiOHOV4ieKeCcajQRnryKX3Vn25gsQ4Ya2Nd/ytE7H+1T0hJCfqClQ==
X-Received: by 2002:a63:b1f:: with SMTP id 31mr1030682pgl.73.1630707673662;
 Fri, 03 Sep 2021 15:21:13 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id 186sm352843pfg.11.2021.09.03.15.21.12
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 15:21:13 -0700 (PDT)
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
 <YS6StQYsctrwXzvu@jeremy-acer>
 <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
 <CAHA-KoMdUq9JVWd5ZburyG7cEQG3sGF-N8-99GhQbz-0+Z3qLg@mail.gmail.com>
 <48bd2c937e15b5baa5f82b3e9cd0d0cdaf2e44a8.camel@samba.org>
Message-ID: <92a66d96-fea3-2a00-6585-7cb15487a468@mattgrant.net.nz>
Date: Sat, 4 Sep 2021 10:21:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <48bd2c937e15b5baa5f82b3e9cd0d0cdaf2e44a8.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!


Thank you for all the advice.  Code is now working on CI. However, have
a newbie query  if someone would not mind answering please.


However, noticed something in my test code
(python/samba/tests/dns_forwarder_helpers/server.py) I want to fix for
portability between different Python versions.  I had to subclass
scoketserver.UDPSocketServer to set the address_family property for
AF_INET6, as this is socketservers documented way to change this, even
in Python 3.9!!


I want to make the __init__ method signature portable by only requiring
the arguments the tests use, initially I copied the full __init__ method
signature.


If I recreate my git commit to grantma/dns-forward-port, will git push
-f completey replace all the code I previously pushed to gitlab and
still keep the current merge request?


Thank you!


Matt Grant

On 3/09/21 8:08 am, Andrew Bartlett wrote:
> G'Day Matt,
>
> Can you keep things on the mailing list or gitlab please?
>
> I'm quite busy with some other stuff and so personal mail risks getting
> lost, we track outstanding patches in GitLab for this reason, so we
> keep a list of what is going on.
>
> Likewise on the mailing list others can help.
>
> Andrew,
>
> On Fri, 2021-09-03 at 07:55 +1200, Matt Grant wrote:
>> OK,
>>
>> This is how I will proceed.  I will alter the SAMBA_INTERNAL
>> dns_forwarder test to have an IPv6 server listening on port 54 for
>> the second forwarder in that test suite.  However this does not cover
>> off the case where the second server is an IPv6 only address with out
>> square brackets, no port number given, defaulting to port 53, but
>> will test the code.
>>
>> testparm support is another issue.  Have not written code for that as
>> it does not look at the dns forwarder addresses given.
>>
>> Patch for new feature is attached.  Just subscribing to Samba
>> bugzilla so I can log a bug for implementing this feature in master.
>>
>> Regards,
>>
>> Matt Grant
>>
>> On Wed, 1 Sept 2021 at 09:25, Andrew Bartlett <abartlet@samba.org>
>> wrote:
>>> On Tue, 2021-08-31 at 13:36 -0700, Jeremy Allison via samba-
>>> technical
>>> wrote:
>>>> On Tue, Aug 31, 2021 at 05:20:57PM +1200, Matt Grant via samba-
>>>> technical wrote:
>>>>> Hi Andrew!
>>>>>
>>>>> Have not created Samba bugs for the following yet, as I am
>>> trying
>>>>> to get
>>>>> the hardest part doen, writing the test code.
>>>>>
>>>>>   1. Dns server port number specification for smb.conf 'dns
>>>>> forwarder'
>>>>>   server list
>>>>>   2. Restricting the dynamic DNS update ranges so that the
>>>>> SAMBA_INTERNAL
>>>>>   server is not spammed with IPv6 PD addresses from the ISP.
>>>>>
>>>>> Main issue is being able to dynamically change the smb.conf
>>> setup
>>>>> for the
>>>>> Python self test hookup, for 1, specifically within
>>>>> samba.tests.dns_forwarder.  Being able to do this will also
>>> make 2
>>>>> far
>>>>> easier.  After looking at the test code set up, I can't see how
>>> to
>>>>> dynamically change the smb.conf file in st/samba/smb.conf while
>>> the
>>>>> tests
>>>>> are running to set up for testing the port numbers or not.
>>>> Look at tests like:
>>>>
>>>> source3/script/tests/test_deadtime.sh
>>>>
>>>> they use a feature:
>>>>
>>>> global_inject_conf=$(dirname $SMB_CONF_PATH)/global_inject.conf
>>>>
>>>> that allows a test to include dynamic smb.conf entries for Samba3
>>>> tests via the line:
>>>>
>>>>          include = $globalinjectconf
>>>>
>>>> inside selftest/target/Samba3.pm.
>>>>
>>>> I don't think the same feature is in selftest/target/Samba4.pm
>>>> but I'd look into adding that. It might do what you need.
>>> Sadly the AD DC (except the embedded smbd) still doesn't reload the
>>> smb.conf (ever!), so that trick won't work.  
>>>
>>> If custom smb.conf options can't be avoided, they need to be added
>>> to
>>> an existing (if otherwise harmless) or new environment.  Sadly if a
>>> new
>>> server instance (like ad_dc, fl2003dc etc) is needed in Samba4.pm
>>> that
>>> is a fair chunk of work, so we try to fit it in with an existing
>>> one.
>>>
>>> Sorry!
>>>
>>> Andrew Bartlett
>>>

