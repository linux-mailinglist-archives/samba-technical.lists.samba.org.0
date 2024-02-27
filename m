Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF13868677
	for <lists+samba-technical@lfdr.de>; Tue, 27 Feb 2024 02:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6upAlB7TMWwZ1nqRxXVF9d09iMAoBl58cTgirr67Ids=; b=GLW6wWid3p/hECGnaHvoVwPSEE
	DlTiwnVpqCLiwcKSW89oYSfNecuqcb1fmcQqLyvXUt3xqEKGXX6I1PjZZhMf+4IJR4vWv6ROjYDR2
	8iHmv2pUYQvV7K8ftGMMCAT9E9iZhwek8Qx2Y7HfbTMsdWS7Zq2EmNSv44DWdYANO3ukrEJs4DO6q
	N25e2epXgQlK4Uw2FyVhcH67XYd0sIPUgOZOxsvZXNFaQ+MxF1JmzU27QnyjeyBX+4ghXmdmCYMGd
	0ifgU6cVI9AsrjzoKKOcU4UfZ0mdWQUSCFYAYWP5E8o8ulsb8I1TCnhD/Wvi/08GkyiHgia5ANCOS
	jYrkHrmw==;
Received: from ip6-localhost ([::1]:43092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1remio-009VBz-S5; Tue, 27 Feb 2024 01:57:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1remik-009VBs-KU
 for samba-technical@lists.samba.org; Tue, 27 Feb 2024 01:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6upAlB7TMWwZ1nqRxXVF9d09iMAoBl58cTgirr67Ids=; b=tTp1L5g9l4tJ3UsF0KsG6pd5sR
 M5vnbz9+lj+XPi2Grcu3mx9B3zMwnccuHsv9fngVg+S+NdWUtmOYFdyPXwFSIUjB4HQMHOi2Mr5Ra
 J5q8bIpxPTSVQ4xBRymdTuixHcQ+G98bu4XxCkeIoa42YWuqhBZS7H9pGva8NqAdOra2o7txnC7CE
 A40+iqn0vsqZUB02jRmPt8QKpNTJraHcCgIoEnU72oV2wlj2YlnyhmqA00wwEpcDwlsUaeKj2ZYZ1
 sKnNgDUFX1Chz/d5jAVCBYr6yP+svqSOE/lyXZCC7HP4U/FAxqRUC8Me3Q5ZfD3S0qxTsWNqueEx3
 ACWx0qCz2ca+EPMUd87lujKa2GDm0g8wfWZ3hqKfTU84uiz91lHeRNtrbcburgCgCdN7jYvhkM7HT
 w2b2mN3CCl13oszyZmZK7ds/jT+NJYGpKYn+6hmVfkoVyKys8u0xF9eWraM+yNKTu08UpVlHOfzrK
 iSSDsyxDG7s0TFhUx5pwtWIU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1remij-00EwuG-2i for samba-technical@lists.samba.org;
 Tue, 27 Feb 2024 01:57:26 +0000
Message-ID: <471f5cbb-f1b9-441b-9f6a-b2c8cd1ef656@samba.org>
Date: Tue, 27 Feb 2024 14:57:17 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: setting up authentication policies in 4.20rc2
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <f16c0d4d-0040-4179-ad24-e40a98d5f0ac@kania-online.de>
 <41970043-2f0a-44a5-b1eb-249f3ed7a219@samba.org>
 <dd0574da-8fd6-4218-9876-b07be2f97fd4@kania-online.de>
 <49439c3b-6562-486a-acfa-26ed990e8082@samba.org>
 <c4f8b006-c039-475d-98a0-d204c8ac4c27@kania-online.de>
In-Reply-To: <c4f8b006-c039-475d-98a0-d204c8ac4c27@kania-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jo Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jo Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/02/24 9:44 pm, Stefan Kania via samba-technical wrote:
> 
> 
> Am 21.02.24 um 03:50 schrieb Jo Sutton via samba-technical:
>> I think the problem is the SID in the authentication policy’s SDDL. 
>> S-1-5-21-2545884418-1286714830-2149023192-512 is the SID of the Domain 
>> Administrators group. Thus, what the SDDL means is “users with this 
>> authentication policy applied may authenticate from devices that don’t 
>> belong to the Domain Administrators group”. Note that it’s the 
>> *device* that the condition applies to, not the user. So it won’t make 
>> a difference if the user is in the Domain Administrators group or not.
>>
>> If you want the policy to prevent users from logging into the computer 
>> ‘winclient’, try using that computer’s SID instead of the Domain 
>> Administrators SID.
>>
>> Cheers,
>> Jo (she/her)
> 
> Hi Jo,
> 
> this makes no sens at all. Normally you don't need a silo at all, you 
> can just create a policy add some hosts and users to the policy define a 
> condition and every time you need anew host or user assign the policy to 
> the user. Compare it with the filesystem (I know it's not the same) it 
> would be the same giving permission via ACL to every single user. Nobody 
> would do this. You assign a group to the directories ACL and give the 
> group the permission and assign users to the group.
> 

Sorry? You told me you wanted to forbid all users who were members of a 
certain silo from logging on to a specific computer. If that’s not what 
you’re after, can you more clearly state what you’re trying to do?

> The same should be done with the policies. You create the policy with 
> the condition (that's the permission comparing to a filesystem ACL). 
> Then you create the silo and assign all the users and hosts to the silo. 
> Then you add the silo to the permission. So I can have different silos 
> with different users and hosts and assign the policy to them.
> 
> But with samba-tool it's not possible to assign a silo to a policy with
> samba-tool domain auth policy modify --name=winclient-pol 
> --user-allowed-to-authenticate-from=winclient-silo
> 

You don’t assign a silo to a policy, you set a policy on a silo.

‘--user-allowed-to-authenticate-from’ specifies the conditions a device 
must meet in order for a user to be able to authenticate from it. It 
corresponds to the ‘msDS-UserAllowedToAuthenticateFrom’ attribute in 
Active Directory, and it takes SDDL, not the name of a silo.

‘--user-allowed-to-authenticate-from-device-silo=winclient-silo’, on the 
other hand, takes the name of a silo to which a device must belong for a 
user to be able to authenticate from it. Is that perhaps closer to what 
you’re looking for?

Cheers,
Jo (she/her)

