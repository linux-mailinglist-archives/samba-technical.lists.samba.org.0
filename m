Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C54F18DE91
	for <lists+samba-technical@lfdr.de>; Sat, 21 Mar 2020 08:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hg2WDBJCVbhGgTS7rtgeuZ+pG3gVmDkmBcRPhDG7xuo=; b=RPCyykX6NcqgYkbAq1sfbB1eud
	qeMb8IfpzlZJ2JosTUdc3rSEza+LuczLJ8v/xQvpb8onda5umBc42ssAikG9N8KtSOXNBPo5KZ3iz
	9nrusFIy/F1anSn7Lgb4raoO/YswT1W9Og4q5lxNFb+PAfdIBJmoon6ivngtl+Is9h2jdA0OP4mdd
	GuPdEtx1RPuglzprW0gzHkvIsq3lKW9Tm4DogzFxVxm8QVrwl+V73mmsZXRy4fqz/JgqyZo+OBsF6
	Tq58IHfTTPm/kZMGtlupRch6qWph95xNGKwNUWhHbtpM0WntfnCbUJJQstt/q+ssWuHRpLAJMjZH5
	40zTZr2g==;
Received: from localhost ([::1]:27614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFYoW-000Mwx-1B; Sat, 21 Mar 2020 07:45:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFYoN-000Mwq-Ou
 for samba-technical@lists.samba.org; Sat, 21 Mar 2020 07:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=hg2WDBJCVbhGgTS7rtgeuZ+pG3gVmDkmBcRPhDG7xuo=; b=DsZ56a4XKlM5U2JkLm4KNQck0G
 tD5aylSSoGLUODFlRocO0CXOXRpoRvnk5NzlsFpVB09qcBbUSqpRtmubRDsD+P5eXSYS26ukrDL5h
 WUf3Xl3rv4XlVzFUpUlSV5KxcSPTOmuieh6I+3XG/85CSlQ6mTDA37Gs268RRIFeTGKJtCKpZIOMF
 K73cfbjql3S8hx5KxCGe1g33UTooCD4R71zBLbvJ6YF5UhecmeYEpLBLi82INzYtZcP9Zl6ljvS2s
 Jh3qIfzi7FFM0eih+pN4LBGOelrgsbwk4a8fZavHnFaqaEqX/IVfZLYuYPbe8dv2ihysH4mgh+GpW
 BDBJuIJn45b1LAq7mMZ2DYtc0nyT0rqOhkLPFOKbOTJcGQ2vPe/1r6avFESNsXGhRongqr4HbO9C+
 bEgY/aRWit70Qdn406qGpUGd5ZHIhjleYxPfJqc/A6H9PKERXV34xjAE7zRx9CHUNq6WdkhbC2yM4
 89bZfL+GJI5D9FNFu11Lkb5N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFYoM-0005fB-Tb; Sat, 21 Mar 2020 07:44:51 +0000
To: samba-technical@lists.samba.org, Karolin Seeger <kseeger@samba.org>
Subject: Re: [Release Planning 4.10] Last 4.10 bugfix release
Date: Sat, 21 Mar 2020 08:44:49 +0100
Message-ID: <1964484.BGPSZMXGVg@krikkit>
In-Reply-To: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
References: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 20 March 2020 09:07:54 CET Karolin Seeger via samba-technical 
wrote:
> Hi,

Hey!

> for your convenience, there will be a last 4.10.14 bugfix release on
> Thursday, March 26 2020.

Thank you very much Karolin!



