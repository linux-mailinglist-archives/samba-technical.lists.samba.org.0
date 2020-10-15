Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBA028F8E5
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=W6VK5khTscYbmPsSr7entO0y+5UjujiNzt5wsBEx3hY=; b=1Sm5rFU9UahJTVEViXKS5kqk3x
	7stKtISLL9FZhy9qGNa5Qk1mwlftq7AlBhqICCy4BbSHIKOI649Gm0Engzh51OV3yalv634eR6CX8
	v107Az3BA7QCGxKO2y4p0pKxltp9W/NNTaluHDpZVSQ47i6Ja5GSXBNXo+xJFXT8hYdep3IE7JqLM
	DmF/lmWa/u808KE1GXMOpGAQ0WBYZUD7eZfWakxFbD2bZ7/cUv4sT0UEVDhkRgNn6tHk18LqP30zR
	flmnxrpezv+BMyHyEvHYP/b3LXplIGzyHROmr/AGBot8VSzGWG6MNihAkv6hA1XAVcBYXQ+hYBDDx
	bwbcx9BA==;
Received: from ip6-localhost ([::1]:57990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8Lu-00CIvP-PG; Thu, 15 Oct 2020 18:51:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8Lp-00CIvI-SC
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=W6VK5khTscYbmPsSr7entO0y+5UjujiNzt5wsBEx3hY=; b=3vl5wyL5p40XgeBYY+FxP315YE
 2Y0oKEJ258hnnvGH42i4rqAfzDaO4SZhCXhcFjRTgGtnBxff3HIHXNS2engmK4NL5T3maEbjyEfxw
 rVYrXeKCYwcgCEijyHZc0Lv03xhNLFF8qgBz+Uzesui0gpQ6q7bKloU7QadHmivfbcz9yleidD1tk
 ObOCWGS1kaRawpouGAwzuVThBkuReRXlREQOfpbQEZ/KtIr3OMnHpuilXc7cybFAcFXj+TcC6mp/2
 RyR/IL0yUmZIQCW9pHNRIfMJiSKS/ROdxthE/9lOKPDx2GpeyAUVW8sRJ3qazfptDHahZxeWikbWT
 PCh8qk5BU86AoN8t4TwD3l7fmwTkha54Gerdlinp15PqkwdrXOCpyYEBS4poAjPkOJBFkLCsSUBsA
 8M6lUrz75DCexohYXnAhJa290mnAegmlEUGgUf9ala0vwXo2pfBYMVlKcoID+9mKdJzE5GZzxbpC5
 Zc8jHUpIfKdMCfpIRLp7+Ogu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8Lp-0002qs-2J; Thu, 15 Oct 2020 18:51:45 +0000
Date: Thu, 15 Oct 2020 11:51:42 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015185142.GE3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <20201015183632.GB3840862@jeremy-acer>
 <5f39ac65-2c4f-c569-2085-2b18f16b0956@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f39ac65-2c4f-c569-2085-2b18f16b0956@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 07:46:44PM +0100, Rowland penny wrote:
> On 15/10/2020 19:36, Jeremy Allison wrote:

> > Well it's representing that you have the right to contribute,
> > so it seemed OK to me.
> Also myself and just about everybody else, if you be believe what Google
> returns from a search on 'Developer's Certificate of Origin'

Hahaha ! You're right :-). I should've done that
myself first:

229,000 results, with many other FLOSS projects using the
DCO name (in fact just about everyone doing this
is using that name :-).

> > I wouldn't get too hung up about what we call it.
> I'm not
> >   The
> > issue is the Linux lot want to keep their name separate,
> > so we should really respect their wishes.
> They are going to be busy :-D

Indeed, they would be *very* busy policing that :-).

> > Let's discuss on the list if we want to change it,
> > and if so what we'd call it.
> > 
> > Rowland, do you have any good ideas on a new name ?
> Not off the top of my head, but the suggested alternative stinks in my view,
> it is meaningless

Fair point :-).

