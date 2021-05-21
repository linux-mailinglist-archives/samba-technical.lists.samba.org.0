Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED12A38C8F9
	for <lists+samba-technical@lfdr.de>; Fri, 21 May 2021 16:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZsZSrzs+oeyT/eQeaC56skcCYNu/oyZM/qXJ3W4DRl4=; b=I+s2Rs2UuBz0e/t/YyBw1Flvtm
	wtAnQ9u1xhihMbkxEdETp25+MfKXMrQh3h7Ti7G3d43GTKgTGKcXpl+CVqR9hjuCUG+FodX8Gi7Hj
	SAVO0MA39XkwjZMVP511LPB57c625rWoUm9l2jrTKAZCK+Xc5wPABLH98XXbACVBouVSFiuGs5xch
	0VSNV7Ns8wmcl3OP0qD7kbW3Fe/9KnE4A0wFfXWpyQiL8VlunNBTDEdTFqNAQqIueX0aBqZyPMQ5Q
	d+p8Pv24V5w+GibBTz4GRzDRBxC7CPuBMzEl0djfKj6pLum74zXp+0O7PcH2Paa+5xwrsFlkGxuga
	vVrXz3BA==;
Received: from ip6-localhost ([::1]:53846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lk5rf-002kfA-UN; Fri, 21 May 2021 14:11:00 +0000
Received: from [195.221.236.186] (port=53982 helo=smtp-out2.ac-dijon.fr) 
 by hr1.samba.org with esmtp (Exim) id 1lk5ra-002kf1-VS
 for samba-technical@lists.samba.org; Fri, 21 May 2021 14:10:57 +0000
Received: from hermes.ac-dijon.fr (localhost [127.0.0.1])
 by smtp-out2.ac-dijon.fr (Postfix) with ESMTP id F147410FB;
 Fri, 21 May 2021 16:10:50 +0200 (CEST)
Received: from [10.0.0.154] (85-170-166-112.rev.numericable.fr
 [85.170.166.112])
 by hermes.ac-dijon.fr (Postfix) with ESMTPSA id E0388F81;
 Fri, 21 May 2021 16:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ac-dijon.fr; s=smtp;
 t=1621606249; h=mime-version:from:date:message-id:subject:to;
 bh=ZsZSrzs+oeyT/eQeaC56skcCYNu/oyZM/qXJ3W4DRl4=;
 b=O2f3MNKEqF+WnMRiqBHPkIbd9qmHIKrHB7xcw+kWZk+orEVwNp3UObPOu0DW9rK6sasyau
 GuREiWfiEJOAcNDKej3mZG1bgfiOKnlRUFJOT5n8EVrQ9FHqwveLjl8xce/vPLqjJRHwNA
 Ig9prmfYsVHiPWVmycylDVzb1Ay4+56eoqEXySOttJXR9VFJtgHpXbrzEIFoj4Sge5Va8S
 MNX5os1CaZxP3hdUZLWD1LEIeS/Js/7kSwJsN68Gz3GPifNTXdczdsU3g9BumasXWfVdIP
 ZteAmsW+ZzXkJgO/+HpC4A4B3f+VoTuwRZB9RopQhkMpdvukJKjcYhk7mHJi1w==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
 <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
 <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
 <303323c1-4683-143a-a619-87996b009539@ac-dijon.fr>
 <c51a7372-fa8f-2f8e-eeeb-7b3bb7e27a89@catalyst.net.nz>
Message-ID: <4a3075e2-850f-f4fb-dfa1-0fb1b60fa9fb@ac-dijon.fr>
Date: Fri, 21 May 2021 16:10:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c51a7372-fa8f-2f8e-eeeb-7b3bb7e27a89@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
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
From: Klaas TJEBBES via samba-technical <samba-technical@lists.samba.org>
Reply-To: Klaas TJEBBES <klaas.tjebbes@ac-dijon.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



Le 20/05/2021 à 23:48, Douglas Bagnall via samba-technical a écrit :
> On 20/05/21 11:33 pm, Klaas TJEBBES wrote:
>> Hello.
>>
>> As you told me I've posted my question on the "samba" list.
>>
>> But I posted it here because it looked to me like a samba bug.
> 
> OK, sorry, I didn't read deeply, and thank you for continuing to
> investigate this!
> 
> Yes, opening a https://bugzilla.samba.org/ bug is the right thing to do.
> 
> Douglas
> 

I filled in a bug report. I hope I've submitted all needed information. 
If you need more, I'll be glade to help.
https://bugzilla.samba.org/show_bug.cgi?id=14712


-- 
~~~~~~~~~~~~~~~~~~~~~~~

- Klaas TJEBBES
- Equipe EOLE
- DSI
- Dijon

~~~~~~~~~~~~~~~~~~~~~~~


