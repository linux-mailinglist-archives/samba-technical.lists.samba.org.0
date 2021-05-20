Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3338AC1E
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 13:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1PqwhcrwVcLmSJL8Yvx7Byh2cenRVo9GQSUYJueTzOw=; b=wxtGxSwjJI7voqTCzFstd9fzdx
	+WnfT2lqNrVZathe5Khyublw0Vi/ioj0GA8CobQRNpFHV9/ImvZXWFxrP5FR5tXM75nrlgaofTU03
	8hfvr5zZvsgas8Rm+KQtjmiL7J+yw/MZTWoJHN+rhGfRWJe7EeAMklD5Kfv2d+04lqg03ePh+hw5b
	R0XEXtRyHFfa4T6HPxUCImJrATv/bs7Q+7Y/4qnzWu4CfQ4f21hWcNsWlY957AvelnIzl+jHwc3lu
	wW3mli0JYJ81VkKraTYpQCxZ++DnGTXEphtVk7NOB7O3awSCNDuQLKbrceJx/s9QB58PiDTLMUWRZ
	kXTT2wKQ==;
Received: from ip6-localhost ([::1]:62600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljgvv-0024Ad-Sk; Thu, 20 May 2021 11:33:43 +0000
Received: from [195.221.236.186] (port=36474 helo=smtp-out2.ac-dijon.fr) 
 by hr1.samba.org with esmtp (Exim) id 1ljgvp-00245T-T6
 for samba-technical@lists.samba.org; Thu, 20 May 2021 11:33:40 +0000
Received: from hermes.ac-dijon.fr (localhost [127.0.0.1])
 by smtp-out2.ac-dijon.fr (Postfix) with ESMTP id 8A936F88;
 Thu, 20 May 2021 13:33:35 +0200 (CEST)
Received: from [10.0.0.154] (85-170-166-112.rev.numericable.fr
 [85.170.166.112])
 by hermes.ac-dijon.fr (Postfix) with ESMTPSA id 8E1D8F7F;
 Thu, 20 May 2021 13:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ac-dijon.fr; s=smtp;
 t=1621510413; h=mime-version:from:date:message-id:subject:to;
 bh=1PqwhcrwVcLmSJL8Yvx7Byh2cenRVo9GQSUYJueTzOw=;
 b=PKbvamLHYe5QRF6yTrYJ9BeM0RyayqmEkVissgjd00abf1/7cy/fITU2YxTZ0Re9ZVq6+B
 TygwQzskdwtfx+GJVksyrG2sl8EIZY5h6wHBWGsFmpTEGdAmak7iQ28idyGVVnZ1IvhNHN
 5uK76AnbEBnRLyfmjnHvxChWxlufczmT961Sl871/Z3u+2L6i7LX20AJvOYw44YpqT95CY
 NIS79BtAONPophOM6rgFC66ULBULTOzluhj6Hl84e+nPm/2yOrmojPpEJ/ChVHOxdBFtvU
 BAgr2fL/5ELbNkUKugw1u8wBpA3pXtphPbZVcyLUu3ePPl5Xow+SsE6qUCg+HA==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
 <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
 <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
Message-ID: <303323c1-4683-143a-a619-87996b009539@ac-dijon.fr>
Date: Thu, 20 May 2021 13:33:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
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

Hello.

As you told me I've posted my question on the "samba" list.

But I posted it here because it looked to me like a samba bug.

I use the "samba-tool gpo backup/restore" and RSAT only and within a few 
steps I have a bug. I've tested this on a dozen of different Samba 
servers, all have the same problem. Playing with DOSATTR (getfattr 
-dR/setfattr --restore) seems to solve the problem.

I read Python but not C (not that much) and I ended up with this file 
(from gpo.py line 47) :
/usr/lib/python3/dist-packages/samba/samba3/libsmb_samba_internal.cpython-38-x86_64-linux-gnu.so

It only takes a couple of minutes to reproduce. All the informations : 
versions, OS, commands, etc. are in my previous emails.



* In RSAT create a GPO named "test" AND make a few modifications in it 
(I did : Computer Configuration -> Administrative Templates -> System -> 
Logon “Always Wait for the Network at Computer Startup and Logon” to 
“Enabled”).

On the samba server :
* 'samba-tool gpo listall' => get the GPO ID of "test"
* 'samba-tool gpo  backup GPO_ID_OF_TEST' => remember the /tmp/... 
directory the GPO is backuped in
* 'samba-tool gpo restore newtest /tmp/BACKUP_GPO_TEST_DIR" -U Administrator

Back in the RSAT :
* "newttest" GPO is empty, the option “Always Wait for the Network at 
Computer Startup and Logon” is NOT set
* "newttest" GPO can NOT be Copied or Backuped. The error is "invalid 
directory".


** What I found :
On the samba server :
* cd /home/sysvol/domseth.ac-test.fr/Policies/{ID_TEST_GPO}
* getfattr -d -n user.DOSATTRIB -R . > ../test.attrs'
* cd /home/sysvol/domseth.ac-test.fr/Policies/{ID_NEWTEST_GPO}
* setfattr --restore=../test.attrs '





Thank you, regards,
  Klaas



Le 13/05/2021 à 01:07, Douglas Bagnall a écrit :
> On 13/05/21 2:19 am, Klaas TJEBBES via samba-technical wrote:
>> Hi,
>>
>> It looks like I don't get very popular with my question here. But 
>> could at least someone test this to tell me if one can reproduce ?
> 
> You are using the wrong mailing list. This one is for people who develop 
> Samba, not those who administer it, and there is not as much overlap 
> between those two groups as you might imagine.
> 
> Try asking on the Samba list at
> 
> https://lists.samba.org/mailman/listinfo/samba
> 
> They love answering questions like this.
> 
> Douglas
> 
>> * In RSAT create a new GPO and make a modification in it (I did : 
>> Computer Configuration -> Administrative Templates -> System -> Logon 
>> “Always Wait for the Network at Computer Startup and Logon” to “Enabled”)
>> * Close RSAT
>> * Backup GPO via samba-tool (in /tmp/...)
>> * Restore GPO via samba-tool (from /tmp/...) with another name
>> * In RSAT try to Copy this new GPO (right clic "Copy", right clic on 
>> "Group Policy Objects" and Paste)
>>
>> I get "Invalid directory". Even doing it via powershell and debug and 
>> traces, hundreds of log lines, I couldn't figure out why it won't copy...
>>
>>
>> Regards,
>>   Klaas
>>

-- 
~~~~~~~~~~~~~~~~~~~~~~~

- Klaas TJEBBES
- Equipe EOLE
- DSI
- Dijon

~~~~~~~~~~~~~~~~~~~~~~~


