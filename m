Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CA846BA5
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 10:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2Evd7rmUYJTrGnpEeBliNTjRMhTeJTsRoU6A5TDvqso=; b=XbhUyBOTkVXJqIV3cvQa7Sw6Th
	tMGdW5b7jOH9YHDmZGRwtXZFa5HYmLQS0IzN6dMf8TccAUGABk3d/fXTHfMFJsY3FJEWGTKW8qKIX
	sEr/k0irC65Um6gCdSnRZu/INN766Xpy0BK/eWWQvOFbluFrc7JjCqKiD4oFicGaZCGQbUOroQBQW
	zzNERUM/E6/sjEQ+MoB5+nsugIk9AIyWwyXp9aO2V56P9LydStf1Z1FqSOYn5zhzoFsuXFGF0K08W
	wDjSb2Jkqf25CMkiuM4tRz1eqOBz3Fs/NB8mfcFzyqpEp/ChHHLya5cph9Qb2BtnQGK3TUwlyhWin
	n+/3RkrA==;
Received: from ip6-localhost ([::1]:35686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVpdd-007LEO-9Q; Fri, 02 Feb 2024 09:15:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34368) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVpdZ-007LEH-6S
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 09:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=2Evd7rmUYJTrGnpEeBliNTjRMhTeJTsRoU6A5TDvqso=; b=lJMYjuk/Ufx0BOrGHzajScWRYW
 X+oiygE6wwfWIS77nJddtCCd5hYpYahhn20oD2vVYsbOMMjrFZtZu+YqvuJU1thv3wWLr0g9vhhLv
 wH89NUrtC3rmSRbvFd51xoZ52JGWT+9i5M/j+GoR+67kMIPXhecA5ohI+OT5CXCl/woZFlrQBj7me
 XhuLJ40Yn6dHMSi/jG2rAbTFwv/wmoWSAhHsq9tThkAeeBDI1PmGU853V0gKIHtzrGnKQzWTQSdbX
 a+nYzOcV2n9N20Dy+q3kfjKPSOjKfkjC31TknIZiwmqxmNw+vsYa2DVZYjojq6c8461ImeOHgR+Vm
 7nPbmFpKPAtwTmdBFQTOM7RSU0hls3cAZOZBP/qdoTG56xuD0ALMCyJxRfcWRrWxQoRxCZJ54guVV
 uYJ4trUYzf/c39XECPFIviXwaWjScb2LpTr7dfN5ArJGXwXQ42D54k9/LswuqFy60X6FKyk3XSV+I
 fNmR6MB4Md6Aoa996p1Iqr8E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVpdX-00BAJP-1v; Fri, 02 Feb 2024 09:15:03 +0000
Message-ID: <e677de75-1ef5-4185-abb7-d29285ee7861@samba.org>
Date: Fri, 2 Feb 2024 10:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question for time based group membership in FL 2016
Content-Language: en-US, de-DE
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
In-Reply-To: <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 01.02.24 um 21:38 schrieb Douglas Bagnall via samba-technical:
> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
>> Hi to all,
>>
>> I already posted the question in the samba-mailinlist but I think it's more a question for developers :-)
>>
>> I have a question about FL 2016 and if samba supports it. If yes, how can I use it without powershell.
>>
>> In FL 2016 there is the possibility to put a user into a group and the membership is time based. So I could put the user Foo into the group 'domain admins' for 30 minutes 
>> and after 30 minutes the system will remove user foo from the group.
> 
> That sounds good. We don't do that, and we don't call it part of "functional level 2016".
> 
> The things that count as "functional level" are listed here:
> 
> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels
> 
> They are protocol level things -- supporting FL2016 means you can properly be a DC in an FL2016 domain.
> 
> Temporary memberships is a useful trick that Windows Server 2016 can do, for which FL2016 is necessary, but not sufficient.

I haven't read the whole thread yet, but note that I have wip patches for timed linked attributes in
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-drsuapi

metze


