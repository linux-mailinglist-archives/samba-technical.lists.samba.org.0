Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC91209CA
	for <lists+samba-technical@lfdr.de>; Mon, 16 Dec 2019 16:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PVSnCLr4Tfu943Hyh7AhB4h77P8iKtGYkG4eBGTBdWs=; b=qghlEOxBdmRMAOjDU/oK/sBDYr
	Mv14nbMvCaiz9h9dCIjv4ZhABgr8l1JrmNZ4Z5TkWpQxMkEiGJgeW95i7jA83zWye0ONPV19V9WvB
	oskYg1oKwt55wtYCGEHTmg9BGXIgGfRKAL0ccqgKA9dK2z9AQ+8XzeFRvB8SUvSZ7MFKLdb+Ez9ch
	fnAaPia7ojMTvFjeOGfoyrT4qJIhBD96xzuQFnDTfU9bLZCOPEMd90DrXMSxol4croBM/yWRe5TGV
	7RLy8nrxdDmB0+XM4g1PFhyFtrKD9TMjg3YsHyvuv3Xn2jYbd6BtQLJPH4bFs5CKscHkhuKZPGtzL
	9i56dO1w==;
Received: from localhost ([::1]:24358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1igsOp-007QKW-KF; Mon, 16 Dec 2019 15:35:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsOk-007QKP-Os
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 15:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=PVSnCLr4Tfu943Hyh7AhB4h77P8iKtGYkG4eBGTBdWs=; b=xZex6DqZdrFoQCJyTy3kcQe9Ug
 cORj/7lXsLb7Uw+cmztrvl07c0LpXxdrMmRISVhGiiW8lO/xyJMbcJAmsw6Ni5JmBpR2PNUQS+QZT
 h6BIEBGDfRPULXqDiAt5vax1do2QGmtow2oPAe1ARVVGTjjz8Y8NLJwT5TAi7lOmiGV/vN9FI4IfA
 p+aymQwjTnLLi/KesWUIgGK98//6TDw7mRBzXC5BnnuIBGwBG8FD+g1X3/midqNxVVPKdunhS4H5b
 Aj+aK58Of0CZK9wTY89oRwvZYivbkvt+rEKz21mD7/W+XiRL6JyLnPsdJGh0M53B11sDLSwc342HK
 sbI986va8a1OpFNaOuAIbIIQIRLk+cemGS6Pq/hm7YKN1eGHw+/T71profe6Oq5zw2mfSSlvT1Lvy
 1L3vC2adpAnXiXEdncmrM9fxpGknbJKbOxBxEKEqIJVpcaMbXHcgE3vRG0kEXD9rL45uJtTG+KyHN
 GmuWC6qn7QBoUiEib37VvpZF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1igsOk-0007UL-97
 for samba-technical@lists.samba.org; Mon, 16 Dec 2019 15:35:02 +0000
Subject: Re: Spelling/typos. /Fix multiple typos found by lintian on debian
 patch included.
To: samba-technical@lists.samba.org
References: <vmime.5df7707d.74d7.61e0656b532253cd@ms249-lin-003.rotterdam.bazuin.nl>
 <7ED1B3EB46AE40D3845A260EA8E4FBD2@rotterdam.bazuin.nl>
Message-ID: <066f97b6-3e24-81f2-f91a-82e537436e44@samba.org>
Date: Mon, 16 Dec 2019 15:35:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7ED1B3EB46AE40D3845A260EA8E4FBD2@rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 16/12/2019 14:46, L. van Belle via samba-technical wrote:
> Hai,
>
> I hoped someone would reply, but everybody seems very buzy lately.
>
> And since i dont want to mess up git, I attached the patch with typo fixes.
> I've also attached the lintian output where i worked from.
>
> Not fixed:
> ressource => resource
> dont => don't
> upto => up to
>
> These three where also in variables or other code parts so i've not fixed
> these.
>
>
> Greetz,
>
> Louis
>
>
>
>
>> -----Oorspronkelijk bericht-----
>> Van: samba-technical
>> [mailto:samba-technical-bounces@lists.samba.org] Namens
>> L.P.H. van Belle via samba-technical
>> Verzonden: maandag 16 december 2019 12:55
>> Aan: samba-technical@lists.samba.org
>> Onderwerp: Spelling/typos.
>>
>> Hai Guys,
>>   
>> Im currently working on fixing spelling errors found by
>> debian Lintian.
>> One im fixing now is :
>>   
>> usr/lib/x86_64-linux-gnu/samba/vfs/fruit.so:ressource:resource
>>   
>> Now im grepping on the type "ressource" but that also showed
>> me this :
>>   
>> librpc/idl/spoolss.idl:         uint32 ressource_id;
>> librpc/idl/spoolss.idl:         uint32 ressource_id;
>> source3/modules/vfs_fruit.c:
>> "ressource", fruit_rsrc, FRUIT_RSRC_ADFILE);
>> source3/rpcclient/cmd_spoolss.c:
>> info2.ressource_id      = 0;
>> source3/rpcclient/cmd_spoolss.c:
>> printf("\tressource_id: 0x%08x\n", r->ressource_id);
>> source3/locale/pam_winbind/da.po:msgstr "Domæne-controller
>> kan ikke nås, bruger cachede akkreditiver i stedet.
>> Netværksressourcer kan være utilgængelige"
>> source3/locale/pam_winbind/fr.po:msgstr "Le contrôleur de
>> domaine est injoignable. Les donnés d'identification en cache
>> seront utilisées. Certaines ressources réseaux seront indisponibles."
>>
>>   
>> my question,  things like :  uint32 ressource_id;
>>   
>> rgrep ressource_id *
>>
>> librpc/idl/spoolss.idl:         uint32 ressource_id;
>> librpc/idl/spoolss.idl:         uint32 ressource_id;
>> source3/rpcclient/cmd_spoolss.c:
>> info2.ressource_id      = 0;
>> source3/rpcclient/cmd_spoolss.c:
>> printf("\tressource_id: 0x%08x\n", r->ressource_id);
>>
>> Should i fix these also? to resource_id ?
>>   
>> And, can put these type fixes in one patch?
>> I'm tekstbook following the git steps, because i need to
>> learn to work more git.
>>   
>>   
>>   
>> Greetz,
>>   
>> Louis
>>   
>>
>>
>>
>>
Hi Louis, believe it or not, but 'wont' is a valid English word ;-)

You missed a few typos/mis-spellings:

s/Crete/Create/
s/behavies/behaves/
s/Thep/The/

One of your changes is this:

   * Heimdal libhdb library provides the backend support for Heimdal kdc
- * and kadmind. Its here where plugins for diffrent database engines
+ * and kadmind. Its here where plugins for different database engines
   * can be pluged in and extend support for here Heimdal get the
   * principal and policy data from.

I think the the second to last line should be this:

   * can be plugged in and extend support for where Heimdal gets the

Finally, this:

+The `check_boost` configuration function allows one to specify the used 
boost libraries.

Should probably be this:

+The `check_boost` configuration function allows one to specify the 
boost libraries to use.

Rowland



