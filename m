Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AAE35C478
	for <lists+samba-technical@lfdr.de>; Mon, 12 Apr 2021 12:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XuFbcs72s0c3ne8Qh55VYWAtfWqZQhBGGIwoH4LE6M4=; b=B5dS08VtwBKZyAub1ZPio6YJJJ
	C2nWZkicV1YssaxYn1VQeWyLjPOoeIE6IytOF107meUNpHNGoh1FL/fPktgF5gnIYnBvZgiCKya/1
	NGFBn77urN17CQ/iNnDVyNRD4hTVMUM486zeJt7APQGtVVKNpmVO2MP674ll9Bg09Puuymo/TkmzB
	v1RBFjSQFHf0GBaG/JWaGE5ap8W2Mkw2yiRtvNE3wiQDvf+cn1NsoWTn69cyRM3a/1lynUkNnuQ3R
	KUUcq0GRMeR94EO7AdNO7JdZXuf+Ik7P/6S6M131vaUVYJqE8oJoJK0H3d6/ueuChxA7HfuMtbJXq
	TPZcw/bg==;
Received: from ip6-localhost ([::1]:30278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lVuDh-00Az31-6Z; Mon, 12 Apr 2021 10:55:05 +0000
Received: from air.basealt.ru ([194.107.17.39]:43076) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lVuDb-00Az2r-AV
 for samba-technical@lists.samba.org; Mon, 12 Apr 2021 10:55:02 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id B8DC7589882; Mon, 12 Apr 2021 10:54:55 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 73AF4589438;
 Mon, 12 Apr 2021 10:54:51 +0000 (UTC)
Subject: Re: Setting up QtCreator for Samba development
To: Andrew Bartlett <abartlet@samba.org>, Ralph Boehme <slow@samba.org>,
 =?UTF-8?Q?Aur=c3=a9lien_Aptel?= <aaptel@suse.com>,
 samba-technical@lists.samba.org
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
 <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
 <16c88278e8ce9e8dd43eab767e633f5f4b0a221c.camel@samba.org>
Organization: BaseALT
Message-ID: <9ee40c71-dbf5-47b0-7220-c9a69ec8e07e@basealt.ru>
Date: Mon, 12 Apr 2021 14:54:50 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <16c88278e8ce9e8dd43eab767e633f5f4b0a221c.camel@samba.org>
Content-Type: multipart/mixed; boundary="------------5197998931DC5AC99197C957"
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------5197998931DC5AC99197C957
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Here is my .pro file for QtCreator (in attachment). I can share it via 
Merge Request on GitLab.

On 09.04.2021 22:54, Andrew Bartlett wrote:
> On Fri, 2021-04-09 at 11:54 +0200, Ralph Boehme via samba-technical
> wrote:
>> Am 4/9/21 um 11:27 AM schrieb Aurélien Aptel:
>>> Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
>>> writes:
>>>> if you're open for other IDEs, I've recently looked at Visual
>>>> Studio
>>>> Code on Linux and that looked amazing. I was just about to dump
>>>> my Emacs
>>>> setup and switch but then mehhhh! :)
>>>
>>> You have to resist the lure of the dark side ralph :)
>>
>> it was tempting, especially after installing
>>
>> <
>> https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx
>>>
>>
>>> But seriously, what did you find particularly amazing? Does it come
>>> builtin with good C parsing/analysis/xref?
>>
>> YES, YES, YES! Out-of-the-box usable code completion in the Samba
>> code
>> base. Functions, structs, macros, everything just worked what in my
>> Emacs setup works for a few weeks and then breaks again for some
>> reason
>> after updating one component or another.
>>
>> The biggest showstopper was: it's just BIG and offers A LOT, so
>> getting
>> to know it would take me too much time. But this is really the first
>> IDE
>> that looks capabable of rivaling Emacs.
> 
> Is there anything that would be useful for us to put in-tree to make
> this work better?
> 
> I know some of our other IDEs have worked better with a little
> integration from the build system, and sometimes we have included the
> hooks to help get folks going with Samba development faster.
> 
> Andrew Bartlett
> 

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

--------------5197998931DC5AC99197C957
Content-Type: application/x-kicad-project;
 name="samba.pro"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="samba.pro"

U09VUkNFUyArPSAkJGZpbGVzKCouYywgdHJ1ZSkKCklOQ0xVREVQQVRIICs9IC91c3IvaW5j
bHVkZQpJTkNMVURFUEFUSCArPSAvdXNyL2luY2x1ZGUvcHl0aG9uMy43bQpJTkNMVURFUEFU
SCArPSAkJFBXRApJTkNMVURFUEFUSCArPSAkJFBXRC9zb3VyY2UzL2luY2x1ZGUKSU5DTFVE
RVBBVEggKz0gJCRQV0Qvc291cmNlNApJTkNMVURFUEFUSCArPSAkJFBXRC9zb3VyY2U0L2lu
Y2x1ZGUKSU5DTFVERVBBVEggKz0gJCRQV0QvbGliL3RhbGxvYwpJTkNMVURFUEFUSCArPSAk
JFBXRC9iaW4vZGVmYXVsdApJTkNMVURFUEFUSCArPSAkJFBXRC9iaW4vZGVmYXVsdC9pbmN1
ZGUvcHVibGljL3NhbWJhCgo=
--------------5197998931DC5AC99197C957--

