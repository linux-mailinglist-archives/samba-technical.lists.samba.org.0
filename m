Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500EE19FE
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 14:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=IftfEi1pP/EC/8hVhPMM3n7XkKcrQXt3O9jMonaZVjE=; b=HoMN9Jf3gNxbs0hEb3qHoRyJVa
	yGH1g59gKbHEEsZ4ebvYPammMebhO++/okrg5jtb58rdf+tuLQWZh5lwv/6WbK5UvzijXbw/mb2pl
	lfUiVWPIpKVfgGuBXtlnFJ398GHTID+Pom6N8K6dbvPmOE4npvsvRWoZ4aC8+tly3tWPqPxHVO72M
	9WWvFe/7B5bRBSj81njO2R98f7MptO37omZ5B3ayFAHM4qS+06ZJ6/Rssw2BNANRi2JLUnMuUXeGI
	wEeWnMQ5BnbBLqrCgU4eGnalUfhPGNxkUW76xPK9nbgjzgNRHzxhaVfTzR+DvfNh5ZzVkYNs6jOTX
	9TPKNMKw==;
Received: from localhost ([::1]:22564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNFid-001goY-FD; Wed, 23 Oct 2019 12:26:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNFiZ-001goR-65
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 12:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=IftfEi1pP/EC/8hVhPMM3n7XkKcrQXt3O9jMonaZVjE=; b=DwqdZCRUpaWAiFYO0fmPRFZsoC
 ijs6oeBbYVPAMW3Ri0j5M8wvHA6eZrAaQORmitUD4BvG4IlS54O1L47EqVCy/sFcpDTl+Kc2vmj4C
 fmpO2fWBi4+YwrZKiDnE0WLKGjFXG0WPkz47i0Kpw5Hau2FnaZS+Kc57mrNVCx5jTonZy7C8QnbzD
 CvU5eu6csQpsjHlpAB4p7eVQhWlEU5iGtrpSz+Yt3FhPBMYdg2HG6wErqPZntQK1tnHTgvIm10yHu
 6dAt6XYDf53a/qq8LLWnkt5n1UY0WMSq8lwaSVJ63P10PeVpK00st9FqS8gTOE1lfvuB/1arByPRd
 2/h8jZp8A6CVktRbgjmGpsUnsv8+SF12JFj2tDNGlJZd5YTYF/miI60PV/x/QemxNW7MfJjfv68lR
 MWVu+vhPpC/qa8Ou6pOtpaByGK4I2+iusmgLjSR84EqYU4WcOFj5LHb3/FnF73W9yAsiPkatLjkDC
 8w5kIr2xI/lzmmJKpWhkBN89;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNFiX-0001KQ-Ts; Wed, 23 Oct 2019 12:26:22 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: noel.power@suse.com, npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
Message-ID: <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
Date: Wed, 23 Oct 2019 14:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/23/19 2:02 PM, Noel Power wrote:
> 
> On 23/10/2019 12:57, Ralph Boehme via samba-technical wrote:
>> On 10/23/19 1:08 PM, Ralph Boehme via samba-technical wrote:
>>> On 10/23/19 12:38 PM, npower wrote:
>>>> * I thought that it would not be acceptable to just effectively remove all of these tests without a clean transition path, e.g. they run till they are removed
>>> All this has to happen in a private branch of course, you can't push the
>>> initial changes upstream of course.
>> what would works as well, and I guess this might be what you had in mind, is
>>
>> * force smb2 in the testenvs
>>
>> * move all failing tests to seperate temporary testenvs that still allow
>> smb1
>>
>> This changeset could the already go upstream, allowing working on the
>> indivual tests in a more piecemeal fashion, because the resulting work
>> can be pushed upstream for every test.
>>
>> Once all tests are taken care of, the temporary test envs can be removed.
>>
>> This would avoid accumulating all the changes in a private branch and
>> the rebase hassle that comes with it.
>>
>> Is this what you had in mind?
> 
> exactly, because of the confusion I probably didn't articulate what I
> was thinking clearly enough, sorry about that :-))

ok, glad we figured that out. :)))

My phone number is in the team repo, feel free to call me anytime or
ping me on irc.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

