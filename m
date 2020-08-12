Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F5B242835
	for <lists+samba-technical@lfdr.de>; Wed, 12 Aug 2020 12:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IenFw0CGFGoMfhPa6d1HGiDLIaie8NdYRCd3yVh22rw=; b=Jk8YGElnzAKhpP5zlSQbNU8ebC
	YURmGNyYZknO/1nABc3koadeP6rN77iqufEOzF3TgpzXt/by3tQG+WggMo90lNiJvFFbXQTiOtQ1w
	4RRcYcQx4hq3NSPvZt1oFhx+yzq7709R8CXwF4sq0yj9fmiOB6FAqlxNxpinzUj5KDdpnqHFuMP18
	13Pm67FCaJmHnmZbHm9w3WGdk1orxVHjRXHp5N0UftmDlIhnVTMCgiFRyGj7857kq/iLsnPX2P28Y
	ffk05G+PaMwS9R8JpPoTOjRft0GJItWz++Gqsq0wYsF2tSWC1SRq2JMktG7n4ammohlFYpYcZF89k
	7UTW6YAQ==;
Received: from localhost ([::1]:36296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5nzJ-00DLL8-MR; Wed, 12 Aug 2020 10:28:05 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:36085) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5nzB-00DLL1-BN
 for samba-technical@lists.samba.org; Wed, 12 Aug 2020 10:28:01 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1k5nz4-0004LV-W1; Wed, 12 Aug 2020 12:27:51 +0200
Received: by intern.sernet.de
 id 1k5nz4-0007wY-SE; Wed, 12 Aug 2020 12:27:50 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1k5nz4-001AVc-O6; Wed, 12 Aug 2020 12:27:50 +0200
Date: Wed, 12 Aug 2020 12:27:50 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: PATCH: fix compile error with xlc on AIX
Message-ID: <20200812102750.GC272474@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>,
 samba-technical@lists.samba.org
References: <20200710115838.GA1587460@sernet.de>
 <20200730174404.GB3868@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200730174404.GB3868@jeremy-acer>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

On 2020-07-30 at 10:44 -0700 Jeremy Allison via samba-technical sent off:
> Where are we with this ? Did it get merged or submitted as
> a gitlab MR ?
> 
> I can't find it...

it's waiting for a reviewer here I think.

Björn

