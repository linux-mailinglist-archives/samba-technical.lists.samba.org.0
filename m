Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C219F06F
	for <lists+samba-technical@lfdr.de>; Mon,  6 Apr 2020 08:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GZhcV3O0Re2/oIf9tjk7sBVshfjVY5UBl3YUtZrPbVI=; b=jCoULrwXWUPAdLXiijxL0J0JbY
	5IQKhLMxlWCwnRjjtKiveq0ZzZ2+DMsP8ZqjBkUFdvrbIpQ4fTPGOFTlZxWTb3BdzejroXA1wBfnA
	hLFjxJyw/n41f7qHgRVuhgc2rRRyn8cxRjEg3qKTVBcrt4S334mFNCL69zqTY77C7IUF1MHRmmqB4
	dlXN1Lekz9jsQAoTF8xqncamqbu/RgOV7FNBiLKtCz5ynEPR8uyLnA1kPMr47vt5ORjX6ftXifXHo
	hfGUVrSGlPU2c4izFShjONkphPYbsHZGvCHoGgSuU2dKddbsjHi2ydn29n2HPD+1fFKCBL2oUKHvp
	7t6ioA1g==;
Received: from localhost ([::1]:64738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLLTh-003WxB-HT; Mon, 06 Apr 2020 06:43:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLLTS-003Wx4-D1
 for samba-technical@lists.samba.org; Mon, 06 Apr 2020 06:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=GZhcV3O0Re2/oIf9tjk7sBVshfjVY5UBl3YUtZrPbVI=; b=hwhw5dbLc3b1c4LEm+6EVw0zXn
 Y1ScxravefZQMwyTF2lLhDO26slMu8vsKqrWDObZlyD6rZk0pwUB+JBrc9+Pdy6iVX4JqGwoJB9K3
 JYz3zBOP/HAL3MDtJ17JKB9UnbKNtqoE+02p9cBI2HotWgxCc5nUJi5TbOKgJVoQjQ5I+a+MIRBLG
 THm8+zG1QK4LANODRD8OWajgE97NsM297wcWQUSfYqj85Uy/V9Li3djyYtiPDQIiTARn3QMvMkpo1
 7qf9lVOai4jFnO3DF3IaDz7u+RZnZzjDOqxHcdGYBYlm+RcjvfWsfLm3F9VAx5FZgLrUGtGRHYt2p
 ehDFRMeJuI6JQF9yP+seo3LvHqPwAXqq2514+hGH+aPMy4wK2ldaqVGbDzqs8a42BotqKst3bTXZW
 FXj/T8CLdpJolCDn2ZnLdHlLthNHF+Rt3r0wCsp0IVMyLh2wN7Wq2qieAFqjzG70Q/LUgibRsSmv2
 9wg2pcFDVxjPLlluxMOTXWnZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLLTN-0006kv-9E; Mon, 06 Apr 2020 06:43:05 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Alexander Bokovoy <ab@samba.org>, Isaac Boukris <iboukris@gmail.com>
Subject: Re: gitlab: mit-kdc on fedora 32 with krb5 v1.18
Date: Mon, 06 Apr 2020 08:43:01 +0200
Message-ID: <1623918.IrRfrNb6Vh@magrathea>
In-Reply-To: <CAC-fF8Ry1imc+yxKpwi4qpZsjbzLejeRX5UB-LAvGM3=yM0A5g@mail.gmail.com>
References: <CAC-fF8Ry1imc+yxKpwi4qpZsjbzLejeRX5UB-LAvGM3=yM0A5g@mail.gmail.com>
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

On Saturday, 4 April 2020 17:12:38 CEST Isaac Boukris wrote:
> Hi Andreas, all

Hi Isaac,
 
> Any idea how to make the mit-kdc build run on fedora 32 with krb5
> v1.18 in gitlab? It looks like it currently isn't.
> 
> https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-test

I guess the way would be to add a new target in scripts/autobuild.py

then duplicate the mitkrb5 entry in .gitlab-ci.yml and use the fedora32 image.

https://gitlab.com/samba-team/samba/-/merge_requests/1216/diffs?
commit_id=43c943a01a84d810f4784b5f2d1c5fdf52fa382b


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



