Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0061F4E32
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 08:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bXe8xYCuO+wb6lndsrM+xLs/dLBJdR51qj0SdPWWzGY=; b=LfYqChUZpuUtZw3rYOBiAU+Is2
	6/tnZ8z6ADT2hOcC3vHo/BWwH97i3j6ianAcNQGGMhd6WIbgklhgF7nfMRBGn3h3+hOsYB96dn9Ui
	uZmo5iigpcN1vkAgA/BYozFNixAL+xWqj/yVEeQDnruHLoEglHw8IML3OhNmXtbEjolSp/En3kUrf
	B5b7jCPkg6NYkjE4QES+8TZrA4Lczt229OMtvy8SaDVnsDRk4aUD6togbTfZ0VCfBgjb1cTZ8fQ1m
	7jD9jq/H6gqHkrBYr2havmE2ayxmE5MkwNTMcEvsfMtOF+im7aZlSuX1LdgNgWF3DUefGRICkrPXr
	G5J4l+0Q==;
Received: from localhost ([::1]:19556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiuEX-009hmR-HM; Wed, 10 Jun 2020 06:29:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiuEF-009hmK-Tl
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 06:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=bXe8xYCuO+wb6lndsrM+xLs/dLBJdR51qj0SdPWWzGY=; b=xRIY94J04fT5loDuTYDCFzt8Rg
 +1b2ZYO4iEq1jpHPll2cvAwAXjRxlKuMs3MBR+lSoX82Eu1kBFecr1e3SfqZadgryg/rsObn/xbOA
 2NMZZiUOODs9h6dHoOVN/dwmGn4l9V9NJqQfo2cQwdRFovDvh3Im2cC1pL3CGLD+qBHiLHobcGrKN
 wTAjxT4h6C6WIuHIb3wZRhk1xQwBcfR4hh20tXGQI1ZOZ/6G6td+y9it7O9W9+mfn4bf/Gz84UXI1
 x0i0QT1x9k7l8mbiBuJNwdbYgm9ewrDApcHO1PsBuEQHdKpFUY8LP2l68uuTfib7r/AerbA5KeaK3
 S9V5P5ky4CRthFRcBam8OMDXiSKcg/hxoA4UdIMB6vQk85yHyg8+0gHdDmoiIIRys9Eynjcqa0SGv
 SOA5YJmBanT0a2zSQb+ZydICcQRXoZJ1UxlP8+AY5VXb6W7bs6Iehrny4sThkV46pKSoKiYorW3H1
 3jeip5rT4IyNOHu5AddXBGcw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiuEB-00055B-IO; Wed, 10 Jun 2020 06:28:49 +0000
Subject: Re: git signoff+ and review+
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2070261.IvKQ8U6GgO@magrathea> <3376401.t2CYSfcsgO@magrathea>
 <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
 <2202468.ZbZBhtArCh@magrathea>
Message-ID: <e9fdcbc4-2e49-5c5a-688d-6679e64c6e95@samba.org>
Date: Wed, 10 Jun 2020 09:28:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2202468.ZbZBhtArCh@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/10/20 8:27 AM, Andreas Schneider via samba-technical wrote:
> On Friday, 5 June 2020 11:15:22 CEST Andrew Bartlett via samba-technical 
> wrote:
>> On Fri, 2020-06-05 at 09:56 +0200, Andreas Schneider wrote:
>>> On Friday, 5 June 2020 02:06:56 CEST Andrew Bartlett wrote:
>>>> G'Day Andreas,
>>>
>>> Hi Andrew,
>>>
>>>> I wondered if we could have an agreed set of aliases included in
>>>> Samba?
>>>
>>> You cannot include those in the Samba repository. Those are all
>>> individual.
>>> All you can do, is provide a script which could set them up running
>>> 'git
>>> config'.
>>
>> Do you mean we can't do it technically, or we shouldn't do it because
>> we are all individual developers with our own way of doing things?
> 
> I'm not sure how you exactly want to achieve that. Please educate me and then 
> I can help you :-)
> 

How about adding those scripts to Samba, and adding a "samba-git-config"
script that would set them up (and then the honorable mentions in the
wiki and/or README.Coding)?

