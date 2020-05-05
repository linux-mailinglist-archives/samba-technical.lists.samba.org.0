Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 305621C561C
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 15:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VyRQIgonUNTTcVUnpJYBROSs/IU3uOikrczXcLpBelY=; b=m/ZfSY2PUhw3NKt1sn5OrM3gvX
	k2uUOhKZ+Od2+AMT03+LCmsCtkF/sC8cOxI1+VY71iQbO9fPk1qTMKUk+H0uuV8eRojhQhNoRRBc5
	i7osThTfGRiDUkE5TU2qhrY8Szxu7fen4m1gEss+hUqn435+1jXUZ6ltdXTF0uq2ocgQJZBcLxLT5
	RLzmX1KGFvGw4RCISGrOk85L3fikxaz7P+GG6sO4w677can/x24TdwGiuti2s4x8LlYLY5BjWc7RE
	fCCa3IBn9I+UvKNLCMK0ooiKD7219Wsrd5mVlbpIIJNRDwcOpIdAdcXsXuQeMBJqn/d6Jz3eP0Q/H
	36jNQ9VA==;
Received: from localhost ([::1]:35216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVxAW-002oyd-Ly; Tue, 05 May 2020 12:59:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVxAP-002oyW-I8
 for samba-technical@lists.samba.org; Tue, 05 May 2020 12:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VyRQIgonUNTTcVUnpJYBROSs/IU3uOikrczXcLpBelY=; b=BQwzNR7vdfNdWktLXv11mtd4OL
 KamhbzAfCh6NkB1/1zal7fL00ZqHg1HikVERfrAtcmOXOuDgKFfyA2knt66Crc4YtQvY/oee19U6L
 PQnJT0yhuao8w4/+ysTqI4OLYryMGsTBYzgf9JvlxizIoFZidNWfSr+3qKsorQFPoHHDmlH06oQNj
 f/7PciZrSDGOkCDr9EN0ftP3vMUoxJM0OKm1vO+Oyo8UV64cLUtv/JtT7npf4ur0N6uhqBz0ZNg67
 U9VBFuG8/drbQVv2iATImQhkjEYGL3PZOa4u+NyZ3dqkM+U+lOS1pCJxhgjd+0YVjYrNzXuFLO+kP
 R9n+2o711R/21Vom/b83C5yumK8K3IEu+bBMLSldHcVpmaiVByM4k+hIP0RyHYESr1zewc4wu5uHh
 FQqbh5atMTYDOmx70GrftMLle+YFY2r73QZjLGknTWbVjzznfnSDyBRmpthe9Cffri5wnY6KdSj+S
 YUiM098vzkt4FCcZVVuxLr6/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVxAO-0002qk-09; Tue, 05 May 2020 12:59:20 +0000
Date: Tue, 5 May 2020 14:59:18 +0200
To: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Subject: Re: GSoC 2020 Community Bonding Outline
Message-ID: <20200505145918.6cba8bed@samba.org>
In-Reply-To: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
References: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Welcome Hezekiah - It's a pleasure to have you join us as part of GSoC!

Cheers, David

