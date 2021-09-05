Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF1400E71
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 08:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SCt3QuDKvG/imLzz1X33pCotaTabEMqSJ0jPO1g1zmI=; b=HMnYWEiVafozGtynUXyedTHiz3
	4Tmf6oPHsAZtyOy8DAtqC5ERJifGhRk6DS0q3cCJ3J75DHvJj6ZlWJI3bNXxxNZ8LVV8BjX5zxpDP
	8bZwLSdXurrPbCA8/mlTXfR4cKm9XP9djjAm5g0SFoOKs5SbNIpxJbIW1Znrjbit7KSmoReM5/1dy
	BX8N7Bbem48DeJ0X1GZn3TEsmfyg32c/jrGft7srcLTIDoIn1pI3Zz6BMhvnv7e9xXcPHDmPAAUws
	zNw/PKJPmSYR53ztbByPVOhT3X3XxR5vMEFY+B9ntZYgLNaJa5gWHK3cdp1FYMFqz2X+MHgjgPcJi
	BnvINQqg==;
Received: from ip6-localhost ([::1]:25626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMlmy-00DNez-1l; Sun, 05 Sep 2021 06:38:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33305) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMlms-00DNeq-1d
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 06:37:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id c17so3431889pgc.0
 for <samba-technical@lists.samba.org>; Sat, 04 Sep 2021 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=SCt3QuDKvG/imLzz1X33pCotaTabEMqSJ0jPO1g1zmI=;
 b=K3IXNpDdp0/iMrydoN6Zmq0wgx52DFcEJu9J2hHJHQvdAubwata0iFQSUaFHNtMsqE
 REyy9l+9Juxq+WHW/6zv+MB6OxSMqKoTXFwHLokUCqau85FJU7u2Cai6RIR8tQNWI1Wb
 g7kePQ8XiFQDHG09h5br4/N1o1EAwO8tWfM7i1nR8DmotkpBFjUOlyQzxrCUDGAFGh/Y
 eI96Gp0mvipP6/u4DfK2OTjokw8H3g0auuOcqt5iSQvXuru+n/sN005N/SL6evftk2oc
 WPj5ISRNTz8iAPm01Pdb9NWclQbgzg2pjFy0uBmSTMGHz/DMMMRC7Hqxaeg6Butpbu0H
 50ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SCt3QuDKvG/imLzz1X33pCotaTabEMqSJ0jPO1g1zmI=;
 b=JT8tNeRUAf4WPtjoahCugPl6xvzQktEGfaZ8zKH+j7EN4JzTT7IbxXMaCGkPFskeD4
 4j2wDKQRVPJQ3+QAsMeTiiemNh01FFKOUzF35CI5WSDcC8CqN353fu9MsEUzLUtRPKsa
 3lfpzt/RB/fK0MH2xEZzMbgzbZiV4ShYh9h2CKtdY7hYUg1xT7IdUU7ADhgNE9rEJqjM
 Z71xSO3+CytmQtF+NQ5V+wFQb6lSgFjtvVpz9QP5hLVjxmML83eyY5r3SKtrHSh93/Bn
 i1CO+nR3LHHKopW6sc4HeGrRtecAbamhk9qYhqXDWa2H9bRvTPtcyt8K/68LYHQFNM/F
 1oHw==
X-Gm-Message-State: AOAM532MNLdl69LK1qi5kb18RgUMs8f80lTOZWddd1/R7x/sUdahRzRv
 pt/r1J7bOBgkYq2jlg6SfJ0lwpE9Wdw3/YaX
X-Google-Smtp-Source: ABdhPJwUog8B8ym6gq00bP4D4ceBCEZESYO42eAbmzA53JmoH6vXJhM30KB29quGZuo4bM0MkM0xpA==
X-Received: by 2002:a65:5a49:: with SMTP id z9mr6474390pgs.121.1630823870331; 
 Sat, 04 Sep 2021 23:37:50 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id x15sm2141834pgt.34.2021.09.04.23.37.49
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 23:37:50 -0700 (PDT)
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
 <YS6StQYsctrwXzvu@jeremy-acer>
 <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <fbfadf3e-e945-ecf7-86b9-4942220e3923@mattgrant.net.nz>
Date: Sun, 5 Sep 2021 18:37:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Sorted by editing the dns_forwarder test to run the 2nd forwarding
server on IPv6 listening on Port 54.

Thank you all!

Regards,

Matt Grant

On 1/09/21 9:25 am, Andrew Bartlett wrote:
> On Tue, 2021-08-31 at 13:36 -0700, Jeremy Allison via samba-technical
> wrote:
>> On Tue, Aug 31, 2021 at 05:20:57PM +1200, Matt Grant via samba-
>> technical wrote:
>>> Hi Andrew!
>>>
>>> Have not created Samba bugs for the following yet, as I am trying
>>> to get
>>> the hardest part doen, writing the test code.
>>>
>>>   1. Dns server port number specification for smb.conf 'dns
>>> forwarder'
>>>   server list
>>>   2. Restricting the dynamic DNS update ranges so that the
>>> SAMBA_INTERNAL
>>>   server is not spammed with IPv6 PD addresses from the ISP.
>>>
>>> Main issue is being able to dynamically change the smb.conf setup
>>> for the
>>> Python self test hookup, for 1, specifically within
>>> samba.tests.dns_forwarder.  Being able to do this will also make 2
>>> far
>>> easier.  After looking at the test code set up, I can't see how to
>>> dynamically change the smb.conf file in st/samba/smb.conf while the
>>> tests
>>> are running to set up for testing the port numbers or not.
>> Look at tests like:
>>
>> source3/script/tests/test_deadtime.sh
>>
>> they use a feature:
>>
>> global_inject_conf=$(dirname $SMB_CONF_PATH)/global_inject.conf
>>
>> that allows a test to include dynamic smb.conf entries for Samba3
>> tests via the line:
>>
>>          include = $globalinjectconf
>>
>> inside selftest/target/Samba3.pm.
>>
>> I don't think the same feature is in selftest/target/Samba4.pm
>> but I'd look into adding that. It might do what you need.
> Sadly the AD DC (except the embedded smbd) still doesn't reload the
> smb.conf (ever!), so that trick won't work.  
>
> If custom smb.conf options can't be avoided, they need to be added to
> an existing (if otherwise harmless) or new environment.  Sadly if a new
> server instance (like ad_dc, fl2003dc etc) is needed in Samba4.pm that
> is a fair chunk of work, so we try to fit it in with an existing one.
>
> Sorry!
>
> Andrew Bartlett
>

