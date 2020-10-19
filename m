Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFC29236C
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 10:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/YYV4nE1Kd4cnmzvGWa1F18OW8p/3C7Igc7b7MgvtR0=; b=f2nN6BSU92RJCYl+VQr8HEoXnx
	aK4Ts5maawS/awKA7M7eC2X3lFMpJFQcZhG6RZO3DXmsQxy7/3NBZsSrI6tLN8RmsctWG76U8+bwq
	cvk22pBm4peEGHbFFq/MpHdKOrZGEDSsLZGGVET26ThhyYXywdBpT6UlquWX0ntww1Ftwr7dYM8bM
	ERPCT4PJaUeVJFqqGM1b+W55NH19vOgsL4s0ndylTAZdJ9Yl7ofZtAvfqa48bNxgOIKttcshQjPZ8
	UCynWLa++FWvyHeFAXl9pzXEJbmOioiQ3Kl0dPLaGPKFrLU/GuDKltO0pSs8ipXCcwz7z7rrvcVXq
	dQJH5Cmw==;
Received: from ip6-localhost ([::1]:31680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUQEy-00CgMa-GA; Mon, 19 Oct 2020 08:10:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUQEs-00CgMT-H1
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 08:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=/YYV4nE1Kd4cnmzvGWa1F18OW8p/3C7Igc7b7MgvtR0=; b=BEdgo3BSSWtLdgsCxsNyAjC16H
 Tvagxqt8dwAxN5Yz5SnG6bIKt1L4FJYLIlGY8NwURMMtuQgUWYGmYlhx/tu4DtWFWp8YRfyD7qHhK
 dvrZFarhY8GYfGOTvnaNdeiuygGReGivdyFoxFhFOzA2Hzyhi0SzXJSB2WOTrBTPbg5qUgtXmC3Uk
 +UtrN4dM0AdoCRLpZY+fQFB6ECqrSVH4RnIAFup4wXOoIcF0/Xi2NMW5c5rAviSkMu4zM+ZG6EZtF
 7ALCmTkfGjDhfu7aO4QKQyFKMDMtUPxym0+Xvd5nl8uNzOQkkp5mBhAdiC7I9x7lFx34XAoX1y/Dk
 l7bNgPTequTsSYIvkrKACICog7Hs3kLIUSqFgieOVFU87x/tfzX5Ugq13VzNuBlzL5LS8AbsFEzEt
 bEuD16SSDICkG6fS6iTGYcuunvgFglzO4id/I8YYXRAZbRmZxw5+JQgTGfvJ8nmOOXgjg76vWzTEK
 sBmqr5ymYYvZTQjreXuQl2zM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUQEr-0001Rx-Nm
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 08:09:54 +0000
Subject: Re: Clarification around the DCO
To: samba-technical@lists.samba.org
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
 <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
Message-ID: <d1d94535-fd9f-e76c-0d5e-3ce454d12f73@samba.org>
Date: Mon, 19 Oct 2020 09:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
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

On 19/10/2020 00:19, James Bottomley via samba-technical wrote:
> On Mon, 2020-10-19 at 11:00 +1300, Andrew Bartlett via samba-technical
> wrote:
>> On Sun, 2020-10-18 at 13:38 -0700, James Bottomley via samba-
>> technical
>> wrote:
>>> On Fri, 2020-10-16 at 19:38 -0700, Bradley M. Kuhn via samba-
>>> technical
>>>
>>> wrote:
>>>
>>>> Jeremy Allison via samba-technical wrote:
>>>>> Ah, I've just remembered *why* we have a difference from your
>>>>> "standard" DCO text.
>>>>   
>>>> Yes, a tremendous amount of time and effort went into figuring
>>>> out the right policy for Samba with regard to contributor
>>>> licensing.  Some of those details were reported publicly, and
>>>> some were reported privately to the key folks in Samba.  I myself
>>>> put in many hours of work on this, as did many other Conservancy
>>>> staff, lawyers and Samba volunteers.  Nothing has changed with
>>>> regard to the analysis.  We also had a private discussion at a
>>>> developers' meeting at a Samba XP about the reasoning, IIRC.
>>> In legal terms you usually really, really don't want to be special
>>> because it causes all sorts of complications if there's any
>>> litigation.
>>>
>>> This reasoning lies at the heart of our desire to move the DCO
>>> beyond the kernel, because if we keep it to the kernel it becomes
>>> our legal specialness problem in the same way.
>> That is all well and good, but the way this is playing out here is
>> really awful.
>>
>> It would be one thing if somebody, perhaps you, came to our project
>> politely suggesting 'have you considered the benefits of'...
>>
>> The process here is just rubbing everyone up the wrong way.
> I understand, so let me try to explain why this all blew up.  The
> origin is a row on another list which is populated by a load of
> lawyers, a lot of whom are also Corporate Counsels.  This other list is
> governed by Chatham House Rules
>
> https://www.chathamhouse.org/about-us/chatham-house-rule
>
> Which forbids quoting what was said and who said it.  However, I'll try
> to describe what happened without violating this rule.
>
> For background, a large number of corporations, through their counsels
> (who are mostly on this other list), have requested changes to the DCO
> over the years (a lot of which were trying to prevent patent capture).
> All of which requests we've rejected on the grounds of not wanting to
> cause DCO fragmentation.  On this other lists, there was a discussion
> of the DCO which lead to the implication that we'd authorized Samba's
> change while refusing all of theirs'. We were forced to deny this
> implication robustly in case the other list members got the wrong idea.
>
> Our robust denial got back to the SFC who engaged us privately on this
> topic.   What we actually said to the SFC was we'd obviously done
> nothing about the Samba issue in the past and had no plans do do
> anything now; however, if the SFC could help us engage in discussions
> with Samba, it could potentially lead to a a win-win outcome we could
> report back to the other list.  The SFC told us that actually they
> preferred to let the matter drop.  Thus it was rather a surprise to us
> to find Bradley's patch on the Samba list, but we figured that now the
> situation had been broached we may as well try engaging.  All the rest
> you've seen on the samba-technical list.
>
> If there's no desire here to investigate DCO alignment at this time, we
> can let this aspect simply drop and you can resolve Bradley's patch in
> the way you see fit.
>
> James
>
>
>
So, I bunch of Lawyers and the SFC are trying to dictate to Samba just 
what is in the DCO and what it should be called. The lawyers are only 
kicking up a fuss and dragging Samba into their argument because they 
cannot get their way. Is this a much simpler version of what happened ?

If it is, then my reply to them would be unprintable and liable to get 
me arrested.

If it was left to myself, I would make any required changes (adding the 
CC-by-SA) and change its name and leave it at that. In my opinion, it is 
our DCO (or whatever you want to call it) and it has nothing to do with 
any external body.

Rowland


