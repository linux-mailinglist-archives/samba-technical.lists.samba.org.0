Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7136E81E
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 11:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Cc:To:Subject;
	bh=k8gxwskCo/FXxPE3MG144tGybIee40eld81fN/fRXOI=; b=dtl7XBtFTFXbQNlNKbAqQ8vAlP
	f7438eMO5YKFP4/42MbCn+K7HO3FwT/Iz1MFyq5yrsLPTqMsMC6GALQhVVHtfNILy2dvBNOungE0p
	CJkNK3nwGEKmFPZDg0gQqRBY+oyez0Xun+YWPRLAbDVWp2GN+IEAivXeS1dIeOxmxtxVfn5b08pQD
	BVKh+4QLlltbDwqjb5JEr1KgP3hdBuJ5tRE9SECMmtS5bJHyS68jeOnXCWj+rtKkd7uR9lqjnKWRx
	epe+NXVsJBFLL7QfJUZCK9GRbhr4BQHs8EhnXP3dYR4ItAyVnrUwb7szQBgPhfbsPS/RS47DypmK8
	hydlI+aw==;
Received: from ip6-localhost ([::1]:43692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc3AB-00D3DP-0v; Thu, 29 Apr 2021 09:40:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54326) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc3A4-00D3DI-SL
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 09:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=k8gxwskCo/FXxPE3MG144tGybIee40eld81fN/fRXOI=; b=vBJJCJtFCvU+vUhvAnVlANpVpE
 70GCWKQh6CxN1n4ytZA888IwcqhAsaVjQzKE7bs9OjpksNj2ua/OLJC2kV5X1n1th/yvLlAPkJ/Tj
 rxSZAtx/w3eSbVX3uAqHzEK2RBoocJ8IAIiDEB6zP3ZvY2u+74NbjZHd3w98NpA/Wk2puCxdp+uXZ
 CHTrRBb3IKC7MbMrgjfWLMfSYsAmbs0ELCL/3fP4T73AQxmWPywceYaoscHJVDGFZZrTjXDuj4HFI
 1vKtucFwre6pk9EKjle6fhD8iWqeJ0jX1vXomtFJ5B5AJlWOQu0teWuuT1eD5FVYIf1xshMlpfwrJ
 K8mL7o16+/2Qra6udYEgOGoZFeoaBFixpx8t0MJVXM6nCvK0cRMnx0t3fjgDtKuymjPmOEdAHfW41
 mi4ZPYSArIt6tvP787eWZbF8TqIjRsxnCWAo7yPci074FC4C+UAvbXTwawF+pR2htVrjF0l7CyvsO
 t0hK7fCXtqziHD+WHeRx71RK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc3A4-0002dQ-9Z; Thu, 29 Apr 2021 09:40:44 +0000
Subject: Re: Ubuntu's ADSys
To: samba-technical <samba-technical@lists.samba.org>
Cc: samba-technical@lists.samba.org
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
 <a9e82907-faef-ade9-910c-6578987c5d72@samba.org>
 <YIaZmO3WleOfenUn@pinega.vda.li>
Message-ID: <eccdfa03-56d0-85ec-62b8-30b4c84f39b4@samba.org>
Date: Thu, 29 Apr 2021 10:40:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIaZmO3WleOfenUn@pinega.vda.li>
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

On 26/04/2021 11:44, Alexander Bokovoy wrote:
> On ma, 26 huhti 2021, Rowland penny via samba-technical wrote:
>> On 26/04/2021 11:27, Douglas Bagnall via samba-technical wrote:
>>> I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
>>> Directory integration":
>>>
>>> https://ubuntu.com/blog/ubuntu-21-04-is-here
>>>
>>> It looks like this is based on a project called "ADSys" (GPLv3, written in
>>> Go), that works as a GPO client.
>>>
>>> https://github.com/ubuntu/adsys
>>>
>>> They use Samba in their tests, as far as I can tell.
>>>
>>>
>>> Douglas
>>>
>>>
>> Well, if they did use Samba, which version of Samba ? I ask because I tried
>> 21.04 in a VM against my Samba AD domain and it didn't work. No matter what
>> permutation of username I used, I couldn't log in. I found out that 'getent'
>> didn't return any AD users.
>  From my cursory look over the code, there is an assumption that AD users
> all named fully-qualified, e.g. user@ad.domain. @ is hard-coded in
> multiple places. They seem to test it with SSSD.
>
>

I had another look at this by installing Ubuntu 21.04 in a new VM. It 
still didn't work, but by working through the errors, I tracked it to 
sssd. Installed the fix I found on the internet and it now works.

Rowland



