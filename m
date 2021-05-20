Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CC38B026
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 15:39:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PrZo6ttKxm7eBM/RWCXF63G0DBbGt8f3BPuz/aihBqo=; b=S4jf0q3q5GU8RR25xkAEM9Hta3
	T6uCwksW69Px/8SAuFMzI6wFy+VoTlkJMrxEqbX7We1Xit4qUPZnZNelmrGFqA2ip3/XXDax0xzz3
	Wx63ZpHoZU41NpV4eP07bhHMcg84Lajfxhx3WtcecQwTQqlP9qLu3Qk6+1igidgDjchitmyK+ErJe
	B9RcOp2pRFy3OCn8MezQ1MYsq97HBuC4HR6CcLeCQDdua8QMhdCot1zVT+TvZiUqZZG7+VzKbOcGy
	wffiCklIJCt0YcPNvQadXOn/vrTB+sTBnu8xgQFtYGLf/Wr0jVsiD5ZKT3pRAsQwU6q02vyATjB8v
	koNBTITg==;
Received: from ip6-localhost ([::1]:40862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljitG-002FF6-4Z; Thu, 20 May 2021 13:39:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljitA-002FEx-Rl
 for samba-technical@lists.samba.org; Thu, 20 May 2021 13:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=PrZo6ttKxm7eBM/RWCXF63G0DBbGt8f3BPuz/aihBqo=; b=f4p/uW6/Ftklr9c3hhLphqiMWk
 F8Bioku5LUN5QVY+2NQD9gbw0HtMPOGaKnWdIqRDfMYMdQHuHc0luagisICQ8e58MN6TIzQlXG1Ga
 88JKKizIORJZiTl1jxeoNCzRBSNDzg5IeEp62y70sR3UF0zzp79n2sj3w7jP+pmPf5tdkD5hh7UpZ
 lSymPsXK6tHfw2FRq6DY8n84WjafOSQsO2Ctp7Uq78yz0eodgiZRcUhK1rbM6utSWoZoQLv/ApQae
 LQ+7kl1hSnYJAt7mZmN4gjUriCudyrn9Ch6cPuXZIyzpIboOQx+oZaKqAWlKkQfAWwitu1TGrRutb
 qWiTdYbsOsr7rfMtYvOkb0sgcU4kEwP1d3UW+ksNXQIBlAmCAtjJn++RUMNfEQOtIam0yhCp0TsfI
 7SwMGXYxk4wiRekFRCFeUIYUfVflZci8cGK2Q1ZB4vmYRDb9CiU0naHfk7CaHYH+ebCx4FBl6JRid
 W7I75p8SmOo8WDE4qW8LUQxs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljitA-0004CT-7l
 for samba-technical@lists.samba.org; Thu, 20 May 2021 13:39:00 +0000
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
 <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
 <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
 <303323c1-4683-143a-a619-87996b009539@ac-dijon.fr>
 <0da3e562-ef39-be8b-6fd8-98501bc95a3f@ac-dijon.fr>
Message-ID: <ac807845-2954-5203-31ee-ff9f877cd0c4@samba.org>
Date: Thu, 20 May 2021 14:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0da3e562-ef39-be8b-6fd8-98501bc95a3f@ac-dijon.fr>
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

On 20/05/2021 14:31, Klaas TJEBBES via samba-technical wrote:
> To illustrate, two attached images showing "test" and "newtest" GPOs. 
> "test" was made using RSAT. "newtest" was made as follow :


Please stop posting to the samba-technical mailing list, just post to 
the samba mailing list.

Rowland



