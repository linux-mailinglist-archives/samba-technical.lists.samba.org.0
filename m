Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E4204089
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 21:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VBq6o6tDY5zalsVeVUx5w01CbytSHe44gB5XLXJ5WRw=; b=StRH/D6Fk4z95IsOyIGq1arG/L
	ovw1/vwTxOk+0DzvDJpgAvIHTYHX7xMkr36qwxW6GbqQgtdQZDpUmq9/g0hDFQWwiBQn1y0uG5wkZ
	7ARYqRATsRi4AlEH6PhvhU0K5ZlDHXmAicpvaEuSKJHR5LXK14q1XhuVT4YrCA2ehh9xb1idpe1Zo
	k3hV+unKLThhAb6LVNrzjAQBIHPlYQs7TLiXZEdSVEd6v2mH/r96Ln/crZw8sYuiTl+xH6o78zMPq
	MwDpl1IHiLLwYVOlFki/gvKHpM80oySKq2l0ZwHWI5c9icNHtq6Yp2QTmNDBNOpf/VQozzYg11Tvc
	1jMsE2wA==;
Received: from localhost ([::1]:22060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnSBF-001sOe-Co; Mon, 22 Jun 2020 19:32:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnSB8-001sOW-Qy
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 19:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=VBq6o6tDY5zalsVeVUx5w01CbytSHe44gB5XLXJ5WRw=; b=tCnm2NmnOArknaxzpm+7flJUvE
 ayONLPk1iPcmbUm8kc3OjlnoHpcGae4vCZfgDUrQmOnSBiIDJsE514cvWDNBPRGd6ys9A+QLlyE7J
 fzI32r6ldrp+QpKBwdhsuNYweoUahFP2r0Zh2SfxpxsxJvZ9kc7Y8/0+K9LR9IwzPtYSGrDpzT4nm
 r+mSRT1ezdddR0VZXublNxBKRv8PEI1dtREu6OC1RF5XHUUy8qC83TsX7ypza3KsfXWStjy1LgAyQ
 4OfBlQKucH1iOFrB2akxFL9dKKGv/cdpEBQSwUh1ajNcHyXaCSCkG9h/hCsdM15T3ZuqRX97CiPuj
 go4OYBYUD5eRnvF+IyAigxUDq0coQocVzUZgFQ37izPax6ZwJVol6ono05KhFTX6PyBBxEgGZ5wzb
 oTroNl3Z8iy2VUvLT5HafIw4zkpF6vpmkTnP0PsVNnzA2xuUQ9FsVI0l4X2bqP/nxjLC4o5E1WeZx
 XyqcYI+716mrHpcWne3Y+oF1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnSB7-0003pI-DY; Mon, 22 Jun 2020 19:32:26 +0000
Message-ID: <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Isaac Boukris <iboukris@gmail.com>, =?ISO-8859-1?Q?Bj=F6rn?= Baumbach
 <bb@sernet.de>
Date: Tue, 23 Jun 2020 07:32:21 +1200
In-Reply-To: <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-06-22 at 10:42 +0200, Isaac Boukris via samba-technical
wrote:
> Hi Björn
> 
> On Mon, Jun 22, 2020 at 10:30 AM Björn Baumbach <bb@sernet.de> wrote:
> > On 6/19/20 11:57 PM, Isaac Boukris via samba-technical wrote:
> > > 
> > > My bad, it was rather easy to reproduce, it only worked in my lab
> > > because I have 'TLS_REQCERT=allow' in ldap.conf.
> > 
> > For testing purposes I typically specify the ca cert the following way:
> > 
> > LDAPTLS_CACERT=/var/lib/samba/private/tls/ca.crt ldapsearch -H ...
> 
> Yeah, that was my last attempt in MR 1402 for the ad_dc_ntvfs env (per
> some comment, fl2008r2dc uses a self-signed cert), that looks like
> working in my lab by not on gitlab yet.
> 
> btw, my assumption was that the smb.conf would be taken into effect
> for the openldap calls, but it seems not - i need to test more
> however.
> 
> $ cat st/client/client.conf |grep tls
> tls cafile = /home/admin/git/samba/selftest/manage-ca/CA-samba.example.com/Public/CA-samba.example.com-cert.pem
> tls crlfile = /home/admin/git/samba/selftest/manage-ca/CA-samba.example.com/Public/CA-samba.example.com-crl.pem
> tls verify peer = no_check

One of the critical tasks that we must address (in one way or another)
with the multiple LDAP stacks in Samba is the lack of consistency in
the handling of LDAP over TLS.

This, from "tls priority" perhaps best sums up documentation that
follows the Futurama line: "You are technically correct - the best kind
of correct"

   <para>This option can be set to a string describing the TLS
protocols
   to be supported in the parts of Samba that use GnuTLS, specifically
   the AD DC.
   </para>

This isn't very much use to our administrators as they don't really
know for sure what parts of our codebase use GnuTLS and how to
configure the other parts.  

Furthermore, our other options like tls verify don't even say this
much.  Even if we can't merge the stacks or options soon, we should at
least have those options point at what (eg ldap.conf) configuration to
use instead.

Likewise, ldap ssl ads should explain more which operations it applies
to (additionally note it doesn't apply to tldap and so idmap_ad as TLS
isn't implemented there yet).

This is particularly important with the renewed interest in LDAP over
SSL (often legitimate, but also often misplaced due to
misunderstandings from the pending Microsoft change).

Finally, and yes I'm a broken record, but this is why I'm passionate to
avoid us having multiple significant stacks here.  We need unification
not just for avoiding internal redundancy, but so our security-
sensitive configuration options work consistently.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



