Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC6711819
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 22:26:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=aFRfFW3LT1KV0hKiMBUG4nO7RnHofA30v+QIZKjE8zw=; b=YLYz5FE7k5mHo6fMFePW8g0Nn3
	785vk3gUZFza3hVz6Cl6eOWvJt5Ee4t/h/wkSN1mNILsemBNVd3WfyrAUb9MM7IttNiBQH9uS29Nk
	Nc87hJcFEZ5gReGWJBHJzPmQe1SPCLqhq4PT6aWtgacpl19E8C04z2zlhQyFBPrlW3Qca5TadE9ue
	s83Rg4Ux4+4f42V94t8br4RW4Q43CFGJR4+luaSd8xp3nuhBu5g+X+Mpat+aNhzOT9+lfvbJi2ZtI
	3BGPAtpGAZmJFsr64d2V8+C2F07ZAcgUOAUWbb7mT4OezlYKTZJazUdWgHm06aTO5SsbAZfh4+gwH
	Rucce2sQ==;
Received: from ip6-localhost ([::1]:63800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2HXR-00CKC4-84; Thu, 25 May 2023 20:26:21 +0000
Received: from 50-196-187-248-static.hfc.comcastbusiness.net
 ([50.196.187.248]:24728 helo=baywinds.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1q2HXL-00CKBv-F8
 for samba-technical@lists.samba.org; Thu, 25 May 2023 20:26:19 +0000
Received: from [192.0.2.96] (work-win10 [192.0.2.96])
 by baywinds.org (8.14.4/8.14.4) with ESMTP id 34PJcH4h017942
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 12:38:17 -0700
Message-ID: <a5b93c60-35c7-c8d4-6839-a776195e12f7@baywinds.org>
Date: Thu, 25 May 2023 12:38:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: Displaying streams as xattrs
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
 <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
 <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
 <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
In-Reply-To: <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: inspected by milter-greylist-4.6.4 (baywinds.org [192.0.2.134]);
 Thu, 25 May 2023 12:38:17 -0700 (PDT) for IP:'192.0.2.96'
 DOMAIN:'work-win10' HELO:'[192.0.2.96]' FROM:'bferrell@baywinds.org' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4
 (baywinds.org [192.0.2.134]); Thu, 25 May 2023 12:38:17 -0700 (PDT)
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
From: Bruce Ferrell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bruce Ferrell <bferrell@baywinds.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/25/23 9:15 AM, Jeremy Allison via samba-technical wrote:
> On Thu, May 25, 2023 at 08:57:18PM +1000, ronnie sahlberg via 
> samba-technical wrote:
>> On Wed, 24 May 2023 at 08:34, Jeremy Allison <jra@samba.org> wrote:
>>>
>>> ADS - "Just Say No !"
>>
>> I think that is a flawed argument.
>> It only really means that the virus scanners are broken. So we tell
>> the virus scanner folks to fix their software.
>> Viruses hide inside all sort of files and metadata.
>> There are viruses that hide inside JPEG files too and some of them
>> even gain privilege escalations through carefully corrupted JPEG
>> files.
>> We fix the bugs in the parser, we don't "drop support for JPEG files".
>
> What is the use-case for ADS on Linux ? And don't say "Windows
> compatibility" - stories about your mother's advice about
> jumping off a cliff have meaning here :-).
>
> Give me an actual *need* for ADS on Linux that can't
> be satified any other way before you start plumbing
> this horror into the internal VFS code.

The argument I'd give against it is that even Microsoft warns against 
the use of ADS.

I'm sure they had SOME idea for it's use in the mists of time, what that 
might have been seems to be utterly lost now.



