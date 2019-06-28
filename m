Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E2590BC
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 04:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hZVMZ3FEp2Kjao3y35LNlBOHuRijuu0cBdC5H0ajh/0=; b=WZ7AAjyhcWPctBxpBBw2PVKeoz
	u3yrtLlNO0XFf89T46QAJ9vMQuNv2cRWv5DfOL1rzw8ZiVHPW1VfI59EUGFUXpWhA901E8g+NrwI4
	rOQokT5uPzxZzpKx1BaH4v4pCX/kmxYzW9hTbEDlWaJ9+zn4ghZYVIkcpOz1Pec6hbqVGESDTTb7Z
	8tv4ceqXZ3TWBPYfAIUMeBxbnzUR/jnqPZiPl1XlcwHWvsbUwat83dOJeiy8FLnMmpMiANPAxwswE
	qTwn64UholTIBoOWKvborMY1GGJ3byLaE/64CJTQYAbZzScl+hVy/klUZI0UpcxMCfFkIhZg154fz
	F9rtQjXg==;
Received: from localhost ([::1]:55252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hggR0-002FYj-UU; Fri, 28 Jun 2019 02:16:19 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:40760) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hggQt-002FYb-MD
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 02:16:16 +0000
Received: from [IPv6:2404:130:0:1000:b58e:701b:534d:7f42] (unknown
 [IPv6:2404:130:0:1000:b58e:701b:534d:7f42])
 (Authenticated sender: garming@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id C4B8380CB5; 
 Fri, 28 Jun 2019 14:15:59 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561688160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=hZVMZ3FEp2Kjao3y35LNlBOHuRijuu0cBdC5H0ajh/0=;
 b=v7mdxenHfww1Kfjj4H1yabt5jwc8bN+vEud0Z8WP7ie7bXxVjq41nGCoRSU4075inPZEcI
 qWWBZB0lw0xKmlWiI+TcadmJAndvvxOlz8KWuy2319HdukIwm/RiTcXbcWPOoM6AlySl92
 8fO5uuSaO2hlsRPiy1ZMpZqxDCo4gk3CBQCD9Sq4/qqrXfyb0BzXpY8AMn/JqkBGAfmpcE
 W4GOlgJ/UGWH5+7eRdXUi5Eskor26Rpw720AcEM7X6EAhPMuZbiqmwInKPaRyFFBfarg1m
 NdVfA8g112wS6kK17mrIVF319Nv2Bwt9AHrd2ETUq4GAr0a+zo29mlTlt80kng==
Subject: Re: [Samba] sysvolreset optimization
To: Simon Fonteneau <sfonteneau@tranquil.it>
References: <b1bdc957-947f-57b7-9513-54114dc31ffd@tranquil.it>
 <5b5dbf6a-7525-2b3d-cc9a-52e36f15fc59@catalyst.net.nz>
 <16567693-b487-b544-52db-16a04b9fd9fc@tranquil.it>
Openpgp: preference=signencrypt
Message-ID: <9369f747-1d78-23bb-7dff-1fe540f88ebf@catalyst.net.nz>
Date: Fri, 28 Jun 2019 14:15:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <16567693-b487-b544-52db-16a04b9fd9fc@tranquil.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1561688160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=hZVMZ3FEp2Kjao3y35LNlBOHuRijuu0cBdC5H0ajh/0=;
 b=s17RLCtFLterG8J8VgTj3Nb6qaHI9/r8a0MVOjSmYQmGCAgUGTgHbeh6xq9YKTArpFaYXx
 9m6YVH1WaEEQosJehmhHu4UyGHtCPMEgkxTcQl9k91Q2qTKuauLGpR14dgbXiKV9BGz4Fi
 EoykKkXHffTPMyTg1MJJ6kaWHOfIquAfCXa7zL3JqoPHBcknOMN2W0h66gYezHAVQt1Qiy
 Zrx872WRyYdQ6uLX5v/mHBatGxJROE2Kydl26evIWv+munnVZXUSjbmNN90lSN1/xlbAKx
 KVmHXtU87c6vyttbhkchD1x0dNV8B7qZvsglfUWHvlwLz/5gxyD6+cm4TFENsQ==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1561688160; a=rsa-sha256;
 cv=none;
 b=ZYtoS2+18mnJf4vyITseiv6CQaLPHVzMs8/EUKIyvNUsOa68Ign9ANkGiBHDlRWiqy1uqr
 Z+3kUbjeNmh0ZUciprhngD3xMbIAAUGArFmxfDllMA2NH871IacD6qNeLC0ld4eNW1inWI
 /sNPez7wlRMJ1IjD5+jhyYLGe17YiGDXTy6nAlVZ9oVKZfuF4ZO2QwkzByi4XxShE2XYaX
 4Nxq504m3CNFWkrSE3MUMQwL/GTwEn+zl4nZCCm2L+3zj9hE0fEIAIxQsdPNFRNE/lZ+Bu
 d0ktGaMvSf2FM3WRdxMnbYIsqZqcGmWSafy8UYw+EL9zqSZeg2v0sTgHQ7OSdg==
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

On 28/06/19 10:13 AM, Simon Fonteneau wrote:
> Hi garming
>
> We managed to put our system in place at the Ministry of Culture and
> it works well. I still have not taken the time to propose a patch (I
> have to spend time with Denis). I propose instead to provide as
> argument a list of files to exclude with an option "--exclude" to
> exclude some files from the netlogon not to reset. What do you think?

That's fine. It seems sensible enough, there's other things we could do
but I would be happy with just that too.

>
> I could also add a "--force" option but is it really necessary?
> getntacl function is unreliable?

It's not so much that it's unreliable, but that it's more to ensure that
security descriptor inheritance worked correctly. If a container higher
up indicates it propagated it correctly, but the code never actually
triggered we may still end up with an incorrect sysvol. I don't know how
likely this is to happen, but these are the kinds of errors sysvolreset
is meant to fix. By changing the behaviour, I don't want to lose the old
behaviour in case it had to be relied upon. In general though, I don't
see any reason why your behaviour shouldn't clearly be default.

Cheers,

Garming


>
> Simon
>
>
> Le 27/06/2019 à 05:06, Garming Sam a écrit :
>> Hi Simon,
>>
>> I was wondering where you were at with this change. The idea is good,
>> but to upstream, I think we need to make sure it's still possible to
>> perform the original behaviour with an option like, --force. The other
>> possible change to sysvolreset I think was suggested was to take a
>> subdirectory argument and to only recurse from there. That could be
>> separate though.
>>
>> Normally, developer discussion like this appears on the samba-technical
>> mailing list (which I've now cc'd), but lots of it has also moved to
>> Gitlab merge requests. I should have just added you to the CI repo, so
>> you can run the tests that way (and maybe create a pull request).
>>
>> https://wiki.samba.org/index.php/Samba_CI_on_gitlab
>>
>> If you have any other questions, just ask.
>>
>> Cheers,
>>
>> Garming
>>
>> On 24/05/19 9:25 PM, Simon FONTENEAU via samba wrote:
>>> Hello
>>>
>>> I'm trying to improve the performance of "samba-tool ntacl
>>> sysvolreset" on samba.
>>> Indeed I have a lot of gpo and over 10 000 files in the sysvol.
>>>
>>> After some diagnosis I found why the "samba-tool ntacl sysvolreset" is
>>> slow.
>>> The problem is in samba/ntacls.py in the setntacl function, the call
>>> to smbd.set_nt_ac is too slow.
>>>
>>> I would like to make sure that in the setntacl function, the call to
>>> smbd.set_nt_acl is done only if rights need to be reset, so to save
>>> time.
>>>
>>> I would like to do something like this at the end of the function:
>>>
>>> if getntacl (lp, file, None, None, direct_db_access = False, service =
>>> None) .as_sddl(sid) == sd.as_sddl(sid):
>>>      return
>>>
>>>
>>> But I can not get getntacl to work correctly in the ntacls.py file
>>>
>>> Do you think my suggested method could work ?
>>>
>>> Simon
>>>
>>>

