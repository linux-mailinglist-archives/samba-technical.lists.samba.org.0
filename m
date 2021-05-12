Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D1937EF0E
	for <lists+samba-technical@lfdr.de>; Thu, 13 May 2021 01:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZcgFRXkkDjhL4DQBrJnZaWCBPO+CJCU+RP8a5XsgeOw=; b=tDiu3NEZVn30ieu0Vgi0NogMXm
	7PiatRavLRWMo8ISDuhpthRk8z7oiI7YYu/cT/N6TGcMlk/Oy/jboXF4l5RQlKc5jxXikUqDoxO/M
	AXGecVxEg/Mh08FNxsxl4ccpx3+jbRb6XjlmkNAoYmrlWsjENLA1dnZ7hW4BndlFrLk4pTnojvTmY
	2LfBr8FL9hg7ZXCdj/z10v1mPFBozeavM1sRaDsJJ42Vp271ocarO/piaZvlQ1pgwpoEVGB9mWO5e
	XeN2IG7D7BpxO8WbwHVmZH85CnpSoxD6C3cTquR2UbjIv95vu2akb5bz3TORU0JjDC54NMVu4w3w8
	7f8kscWQ==;
Received: from ip6-localhost ([::1]:26722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgxxD-00HOMw-N3; Wed, 12 May 2021 23:07:47 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:56616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgxx8-00HOMn-7D
 for samba-technical@lists.samba.org; Wed, 12 May 2021 23:07:45 +0000
Received: from [IPv6:2404:130:0:1000:c423:b4cf:2d5b:d925] (unknown
 [IPv6:2404:130:0:1000:c423:b4cf:2d5b:d925])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 0EE5780FAC; 
 Thu, 13 May 2021 11:07:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1620860840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcgFRXkkDjhL4DQBrJnZaWCBPO+CJCU+RP8a5XsgeOw=;
 b=bLRtKxED7Z3mU5pZwhvX8bhPmyD5KtynVqQICRin1qylepxUmxS0kWhdHAbOVZgPNMRabU
 Cy5mJT0rFThimqYj7KOzumlpTbf5R2OAwpv89smjwa9yAREBMjyuNGpBSillBRYAl0yvEx
 7vghzsAbHMAqslrYINSXDdNgll5XJYIvBvOC93N2F7GRSLuZb7ZJi1nWBLdCxGLn8YMdrc
 iIYnCAppUocfm+SzT4ToPi4l5e0ufuoHOQVEkMzGoEWNmYbktVd3900SV2AGfQOjtTyeBD
 2wYUKTgOc1lA7Es/7Uyy1NDbTxqmKkXuBn9YxGCAJGLg121FPL2O27cjQdIOKw==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: Klaas TJEBBES <klaas.tjebbes@ac-dijon.fr>, samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
 <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
Message-ID: <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
Date: Thu, 13 May 2021 11:07:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-NZ
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/05/21 2:19 am, Klaas TJEBBES via samba-technical wrote:
> Hi,
> 
> It looks like I don't get very popular with my question here. But could 
> at least someone test this to tell me if one can reproduce ?

You are using the wrong mailing list. This one is for people who develop 
Samba, not those who administer it, and there is not as much overlap 
between those two groups as you might imagine.

Try asking on the Samba list at

https://lists.samba.org/mailman/listinfo/samba

They love answering questions like this.

Douglas

> * In RSAT create a new GPO and make a modification in it (I did : 
> Computer Configuration -> Administrative Templates -> System -> Logon 
> “Always Wait for the Network at Computer Startup and Logon” to “Enabled”)
> * Close RSAT
> * Backup GPO via samba-tool (in /tmp/...)
> * Restore GPO via samba-tool (from /tmp/...) with another name
> * In RSAT try to Copy this new GPO (right clic "Copy", right clic on 
> "Group Policy Objects" and Paste)
> 
> I get "Invalid directory". Even doing it via powershell and debug and 
> traces, hundreds of log lines, I couldn't figure out why it won't copy...
> 
> 
> Regards,
>   Klaas
> 

