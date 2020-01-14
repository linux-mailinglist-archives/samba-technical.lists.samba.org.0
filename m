Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94613A5B1
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 11:14:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2MlcDNL5hgDx7ZbBmc9bcZmY5NAsb9/BmdPY4POU/XU=; b=Ujh2SlYL0fdhxzAeib01UZ31RT
	ST1W7knY5hrwAbPwPj+lbUalnh6+aAsE81ptapWGVdOIc+BksB8QBWkk+T8pXcDxEY7zPqnYYGR2M
	+54/p8UsciepFRzeei9cn0n9HCuSoOMCLKJ5/0kcUk64twz+biB3IcvuDAkZscXEuLq7bThZuRZuC
	lDgEnS1DOguMXI07KHVJDtQjLn58dyO9ZQcGEH5KeiedXM3sdDRCcsQxxZUG4EOWPRR+r1C5j0X3q
	goEJ1fxSelXqXxNlQ6U2LnfjVjmlotfLOn99ym0f7EJsUWXW6q87vthhijvnC7wFclX66bsYCtHLc
	jqCm8Ckw==;
Received: from localhost ([::1]:25230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irJCw-003LPC-Te; Tue, 14 Jan 2020 10:13:58 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:43783) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irJCo-003LP5-UI
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 10:13:56 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1irJCn-0008Lt-La; Tue, 14 Jan 2020 11:13:49 +0100
Received: by intern.sernet.de
 id 1irJCn-0004MH-Jp; Tue, 14 Jan 2020 11:13:49 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1irJCn-0002u8-Cg; Tue, 14 Jan 2020 11:13:49 +0100
Date: Tue, 14 Jan 2020 11:13:49 +0100
To: Jeremy Allison <jra@samba.org>
Subject: Re: PATCH: verbose mode for smbclient tar
Message-ID: <20200114101349.GA10876@sernet.de>
Mail-Followup-To: Jeremy Allison <jra@samba.org>,
 samba-technical@lists.samba.org
References: <20180103220242.GA18446@SerNet.DE>
 <4f5db9d3-d36c-d4e0-9c89-5176d18e119b@rsmas.miami.edu>
 <20180103224358.GA21944@SerNet.DE>
 <20180104112058.GA1747@SerNet.DE> <20180104205048.GA242638@jra3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180104205048.GA242638@jra3>
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

On 2018-01-04 at 12:50 -0800 Jeremy Allison sent off:
> On Thu, Jan 04, 2018 at 12:20:58PM +0100, BjĂ¶rn JACKE via samba-technical wrote:
> > On 2018-01-03 at 23:43 +0100 BjĂ¶rn JACKE via samba-technical sent off:
> > > On 2018-01-03 at 17:17 -0500 Jim Brown via samba-technical sent off:
> > > > isdir is uninitialized for all non-directory items.
> > > > isdir should be initialized and then used the if statement.
> > > 
> > > thanks, attached fixed!
> > 
> > one more with a minor documentation fix on this for the new v switch.
> > 
> > Bjoern
> 
> Bjoern,
> The "normal" status messages produced from clitar should be printed
> using d_printf() instead of a DBG() (which maps internally to a
> DEBUG() statement).
> 
> I know clitar.c currently messes this up by mixing printf() and DBG() -> DEBUG()
> but moving forward we should try and clean this up by moving printf() to d_printf()
> and ensuring that only internal status messages (which may be part of the
> 'verbose' stream) go out using DEBUG().
> 
> If you don't have time for this now, let me know and I'll review the
> patch as-is, but eventually we need to fix this up correctly (we can
> do it as a patch on top if you prefer).

done now, see: https://gitlab.com/samba-team/samba/merge_requests/1052

Thanks
Björn

