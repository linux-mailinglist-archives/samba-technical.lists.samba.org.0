Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95A461FB8
	for <lists+samba-technical@lfdr.de>; Mon, 29 Nov 2021 19:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ok4uKKGSTk4p0yYxv2QRxL9x4nnbrUQrc4yllPT/1iI=; b=4/s8jpn5PedKRoSDo90DgeIlWR
	FkeDOUiBbVcCpu4wOptLI+CrclUDUowYayxHHwNMMJCl9SV6qepK8OJ1p2RQu+rjooho4QVc7xN7H
	7OH0IREeSQ8JAXTnROTnbftR49LUYgq3QiB6ep5LJLX883FJ8X1/jMUt7wSYbiefPVUaO0gu3i51g
	wqIAxme64ctftAHMxJbd2YW1qEzo1ZBxYGFDNPM052uj2WdLF78EgOHqNQL+AoiP1bG8ft6852Dks
	4euFwSOtixn1Ys2BlejOo6evJWaJ6yfp+dAN2F92JmMniUfE56TbvdPswK5mXmE1w7EauPyCjwOgA
	e7iO4yFg==;
Received: from ip6-localhost ([::1]:39760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mrlpc-000eJz-P6; Mon, 29 Nov 2021 18:56:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mrlpV-000eJp-56
 for samba-technical@lists.samba.org; Mon, 29 Nov 2021 18:56:50 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A5EFB3F2FC
 for <samba-technical@lists.samba.org>; Mon, 29 Nov 2021 18:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638212201;
 bh=ok4uKKGSTk4p0yYxv2QRxL9x4nnbrUQrc4yllPT/1iI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=oCjsOBKgCWnecWlcXcAt2Ofm5x5i+ARC9Hfs8nkyJRuIkb/giHN/y2bRQzZKdNdM0
 INaHM2v/ElIcHRi4JZ+vlNfhJHXXq7qyUtQQtnOPDXDvIqvrJeRX/bi+afu3P4y6wt
 KDt3rHQph0KFuqbgiOqY+kb/HFEmifQLfodjdpsVYVUG1lImHVTcutM5FoFhRySw40
 ZuQKriOMq+1aPUUd3RZEuJtuxR0EKoRHfJVz6tamDZ7WcL7esqfQhc36gn/y3u0SSb
 cPXm2R0K3y4Vw7OwVSlYv8MczKfUH1ej7VklM17/EpHzV0e0BF+jzkxW8W1NMWdnT9
 D8GY3JuB0kSqw==
Received: by mail-pf1-f200.google.com with SMTP id
 c131-20020a621c89000000b004a343484969so11313911pfc.3
 for <samba-technical@lists.samba.org>; Mon, 29 Nov 2021 10:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ok4uKKGSTk4p0yYxv2QRxL9x4nnbrUQrc4yllPT/1iI=;
 b=H3nGG+IBLQN3SVx+03InErk21UWnXkCseJg8nfRG5OoBF2hKnnWO/ngu3h627ATCTk
 5ID6OrUoOfEOo1fksM8NfO+Tl5jNBtHdmoARChNAX4//YtgnvD9uskKh9hDMLMwEc7Tb
 vVuIRT1rr58+JR+7qYWbsXWvJyGzs+wictLMDORH75EpXfvMGOo3+gX9msgH8D11kWCk
 dcrcwzRD/oFy520xFT0l2LjLY4f2cTiWEiwMw7tPdgbomJPOIendXf1vwYh0T1pyyK6H
 Ttv+XHBAE0fvZAkzrqBEktjv7EN1c2fhqxbQBIg1uiqukeSG5BSmwshsgCg1tY4H1iH3
 x5DQ==
X-Gm-Message-State: AOAM532qQHZCdgUo4cwDW8vqEPoP6EzgN8+MpCo71CRXpeCu6+GtP6g1
 pmIT8ftov4k6woAirZbPB84RXyRDHKYJldG8cbdnm53c95la33A+X/IN751VDWDUX2KAgT4shEo
 TEdHs6hh7LA424KJK7462ZfC4coCHFqHajEY34Nz+uX7Now==
X-Received: by 2002:a17:902:7616:b0:143:a8cd:ef0 with SMTP id
 k22-20020a170902761600b00143a8cd0ef0mr61917181pll.48.1638212200319; 
 Mon, 29 Nov 2021 10:56:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/BkSAQbSZFobcpK6b56IvT8KwOyOfFMcjPsmM1aFyNsfSddFxK0GI5ICJJ2P36qgEQdf/Ow==
X-Received: by 2002:a17:902:7616:b0:143:a8cd:ef0 with SMTP id
 k22-20020a170902761600b00143a8cd0ef0mr61917161pll.48.1638212200099; 
 Mon, 29 Nov 2021 10:56:40 -0800 (PST)
Received: from [192.168.1.124] ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id x14sm83630pjl.27.2021.11.29.10.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 10:56:39 -0800 (PST)
Subject: Re: Commit f980d055a0f858d73d9467bb0b570721bbfcdfb8 causes a
 regression
To: Jeff Layton <jlayton@kernel.org>, len.baker@gmx.com
References: <a8b2287b-c459-2169-fbf4-31f3065e0897@canonical.com>
 <0e6e66f7368621128a810bb604eab229dd279187.camel@kernel.org>
Message-ID: <7592d67c-3311-afd0-6ea9-64bd4d2769b6@canonical.com>
Date: Mon, 29 Nov 2021 11:56:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0e6e66f7368621128a810bb604eab229dd279187.camel@kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
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
From: Tim Gardner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Gardner <tim.gardner@canonical.com>
Cc: linux-cifs@vger.kernel.org, pc@cjr.nz,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Kamal Mostafa <Kamal.Mostafa@canonical.com>, stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 11/29/21 9:01 AM, Jeff Layton wrote:
> On Mon, 2021-11-29 at 08:35 -0700, Tim Gardner wrote:
>> Hi Len,
>>
>> I have a report (https://bugs.launchpad.net/bugs/1952094) that commit
>> f980d055a0f858d73d9467bb0b570721bbfcdfb8 ("CIFS: Fix a potencially
>> linear read overflow") causes a regression as a stable backport in a 5.4
>> based kernel. I don't know if this regression exists in tip as well, or
>> if it is unique to the backported environment. I suspect, given the
>> content of the patch, that it is generic. As such, it has been
>> backported to a number of stable releases:
>>
>> linux-4.4.y.txt:0955df2d9bf4857e3e2287e3028903e6cec06c30
>> linux-4.9.y.txt:8878af780747f498551b7d360cae61b415798f18
>> linux-4.14.y.txt:20967547ffc6039f17c63a1c24eb779ee166b245
>> linux-4.19.y.txt:bea655491daf39f1934a71bf576bf3499092d3a4
>> linux-5.4.y.txt:b444064a0e0ef64491b8739a9ae05a952b5f8974
>> linux-5.10.y.txt:6c4857203ffa36918136756a889b12c5864bc4ad
>> linux-5.13.y.txt:9bffe470e9b537075345406512df01ca2188b725
>> linux-5.14.y.txt:c41dd61c86482ab34f6f039b13296308018fd99b
>>
>> Could this be an off-by-one issue if the source string is full length ?
>>
>> rtg
> 
> Maybe? But it doesn't seem to be that long. The error message evidently
> says:
> 
>      "CIFS VFS: CIFS mount error: iocharset utf8 not found"
> 
> The iocharset string ("utf8" here) usually gets set in the mount string
> and then we just pass that string to load_nls().
> 
> The patch you're pointing out though doesn't seem to be involved in any
> of that. It sounds like something else is wrong. I'd validate that that
> patch was applied correctly, and get more details about what this guy is
> doing.
> 
> g/l!
> 

You may be correct. I made the rash assumption the reporter had done a 
normal full upgrade. However, it appears he may have only done targeted 
package updates and neglected the linux-modules-extra package that 
contains the nls_utf8 module. My test kernel installation instructions 
_did_ include linux-modules-extra which is likely why it worked for him.

I've requested more info from the reporter to verify that the missing 
package is the root of his problem.

Thanks for responding.

rtg
-----------
Tim Gardner
Canonical, Inc

