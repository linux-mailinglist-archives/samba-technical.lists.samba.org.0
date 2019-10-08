Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C1CF7C2
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 13:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=H/UlPE23+GOAn1YBUAsA1/pjbxCKNqH+TtHJ7Eisu8g=; b=2NSelhLcl84vtf4HjVuQOXSxjS
	DmcBg3m38oIefn9Q7VefvWQxbYIMIEFZtJ5C+yryJ2CUzLBcVP7EJsxGggjlu/oKkzXvBtekDtXAt
	x1zWJvGHmnGaYWjUSX0eMMZGWwYei/a3RHGL9rf+Z/lOSeMJ5O9u/W6k2Z19P3SgWS9vMhnk5iiIs
	0PNS31WyjxByVnlb6r4YsUDHjnVtuoQTWsFgSGWgwly24tcH5EEXmHtRWJh+W2SzJFIh8h/hxsNDG
	fohk/leEvx70Q+0Qb2oiI5SH/didEhfX0YukW+c3ohfcllWdLB+NxaTmRQO12EPGfuUS5FweIGwAK
	nJYeE8zQ==;
Received: from localhost ([::1]:44942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHnKn-0024EY-FW; Tue, 08 Oct 2019 11:07:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55982) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHnKj-0024EQ-DW
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 11:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=H/UlPE23+GOAn1YBUAsA1/pjbxCKNqH+TtHJ7Eisu8g=; b=gMeqVvkO+1FrP+NxEnYfOgbFEF
 omfO44MNcY97ALbGNmqjhJk+f/Y9CdbmtJrQ9ViLsI0jVlJP77soxg2Y5K3mZb8J9K02i2X7uMLyS
 yHHlBJ+xz3XgVcJ+06lJiE8vFdhxa1fF890O3ZAK+XWfsepQjX6Nz88jissQbFTTCxIU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHnKi-0005hz-Ir
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 11:07:13 +0000
Subject: Re: Samba and legacy Windows support
To: samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea>
 <b650575c-58cc-8602-34f1-be5dd28a8601@samba.org>
Message-ID: <d6e9fc50-f0ff-ecc6-0aee-d07887e3e687@samba.org>
Date: Tue, 8 Oct 2019 12:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b650575c-58cc-8602-34f1-be5dd28a8601@samba.org>
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

On 08/10/2019 11:43, Ralph Boehme via samba-technical wrote:
> Hi Andreas,
>
> On 10/8/19 10:59 AM, Andreas Schneider via samba-technical wrote:
>> Samba with version 4.11 currently still support a lot of systems which are
>> already out of support. We still get bugs to either fix support for Windows
>> NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory is
>> still deployed.
>>
>> In order to remove support for those platforms which are very long EOL, we
>> should try to make announcements when we plan to remove support.
>>
>> ## Steps planned
>>
>> With Samba 4.12 we plan to disable SMB1 by default
> as already pointed out by Rowland: mission accomplished with 4.11. :)
>
>> and then remove support for
>> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
> We can't remove it unless existing SMB1 tests are converted to SMB2.
> Thankfully, it seems David and Noel took the stab. But we can't announce
> until this is completed.

Whilst you are quite correct that we cannot remove it until everything 
that needs to work without SMB1 does, I think we should announce that we 
plan to remove it from 4.14 if possible. This would do two things, focus 
the team minds on the task and warn users that it will happen at 4.14 or 
the next version.

Rowland


>
>> If we remove support for SMB1, we could also remove support for NTLMv1 and
>> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use of
>> these encryption types is blocked by the default system-wide policy and is not
>> available through MIT Kerberos. DES support is fully removed from MIT Kerberos
>> 1.17.
> Sounds good, though crypto is not my game.
>
> -slow
>


