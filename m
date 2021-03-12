Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A73F5338304
	for <lists+samba-technical@lfdr.de>; Fri, 12 Mar 2021 02:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Yjq5yfc0qa5lRh5VB1OJfjcMJp0JSUw5Y8HChPWAOV0=; b=1AR53DMP+pAse7GF/xy6NiP1b7
	x3dWK6RVzAHwLDdxzGwn9C2ZK/S9TshKa65CxoS6H7dzx17cDackcyDJ4IXNh0uiC6sXKcY9xM800
	YeOueQ+ClgA5C7UXVtEnKWp+xh4VTMaHb8K4UYTqrLoiD7OeLGVyvCbiTsdtAAKTZv7oea1y9v0B/
	fRimD+EmDhwHlGLkLpAcv1Ao5oE8oRt5k50k2tRoc/wjcwB9FhYERRPQ3p/bzZOnCZBKBPUZyNFgN
	rslVKgjhjraljG4QX1aieJwAHVvsENSzH1XSXZSquAJAr2753zX7W/AtZAa3WWrCY9ElBwwRw0Exm
	ypqf6qnw==;
Received: from ip6-localhost ([::1]:58694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lKWJE-0056Fr-JG; Fri, 12 Mar 2021 01:09:44 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:60908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lKWJ8-0056Fk-NF
 for samba-technical@lists.samba.org; Fri, 12 Mar 2021 01:09:42 +0000
Received: from [IPv6:2404:130:0:1000:206a:2a76:9dc3:579c] (unknown
 [IPv6:2404:130:0:1000:206a:2a76:9dc3:579c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 1F61C82735; 
 Fri, 12 Mar 2021 14:09:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1615511343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yjq5yfc0qa5lRh5VB1OJfjcMJp0JSUw5Y8HChPWAOV0=;
 b=o1VOcRl1lUqFU8RTiC+xJ84irtYPN9EQfr48SBA3sGky7hMhrbzfZy6/uvIUHd4dHyhrax
 7HTCCom6G0kud2GsbzAnU2UDsph8r2xuBrp8rogoSuE0TlDt2qnrcVhZPfwNDNCacRixLT
 2Xh4fIK7rOsNR42A1IOvETDZ9b675KGOVzcwdt8VeYILLvax3OuyR09EuXNUXJPKNlIaty
 OUVdItAiU1e1cDy9SqQ5QuJDTuHeKiaXBu8We+UxePty6/vLgGg1e2wLrRUZvoxU0dOcBm
 +sefunN8JyQJAsnWvdCJGpSuMigT2KTwzsdDfF6AYE29NSC/b0O6xo++kWGc0w==
Subject: Re: I want to delete the Samba module source3/modules/vfs_tru64acl.c
 for Samba 4.15.0 release
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org,
 samba@lists.samba.org
References: <20210312005626.GC1939059@jeremy-acer>
Message-ID: <17a0a2a4-42d7-82da-4b6c-d966fb0c8c4e@catalyst.net.nz>
Date: Fri, 12 Mar 2021 14:09:02 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210312005626.GC1939059@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MIME_GOOD(-0.10)[text/plain];
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

On 12/03/21 1:56 pm, Jeremy Allison via samba-technical wrote:
> This reference:
> 
> https://en.wikipedia.org/wiki/Tru64_UNIX
> 
> shows the date support was discontinued for
> the entire Tru64 OS was 31 December 2012.
> 
> I'd like to remove source3/modules/vfs_tru64acl.c
> from our tree as part of the VFS modernization.
> 
> Any objections ?
> 
> Jeremy.
> 

I closed https://bugzilla.samba.org/show_bug.cgi?id=4980 in anticipation.

Douglas

