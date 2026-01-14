Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5B3D1F934
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jan 2026 15:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YFJhOM8sFu0HCzoDkuIg84ZPq5a1Jl3KeJEH/2mE348=; b=sAKwmFVspk38OySw8YIn7Qgibu
	lOLZmTfEd5gZqeD3e1w/zlim1iShQRsj7pDYL50ikj47KJWL6S9UmyXbJe6grrKEz9HiwKfTu1luo
	2fBciFdpiniURglqlALAsjt9blJoh6NJXKUCdZ2c9+BHLL/Rg38FVR3/A/vH/u9qFMi7rGw4nfXcL
	2mgMdyW5XulmAnBgcaYfC7aCesTdHQ8TvVjo8z2LZrYqs72blL3YxCz4l3q/Apl+2I3PG7nvvaa9A
	l9MNdururwsyRXd50hIY1uacUIngAT34r60zrcJgs+WzyBV7lhegBeGWbt54MFmcvwXxfeWPxD5/x
	KMpCXSeQ==;
Received: from ip6-localhost ([::1]:58670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vg2KB-0007B6-72; Wed, 14 Jan 2026 14:58:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37906) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vg2K6-0007AP-Cx; Wed, 14 Jan 2026 14:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YFJhOM8sFu0HCzoDkuIg84ZPq5a1Jl3KeJEH/2mE348=; b=trz2eL1rJuH9FvQKzVwyHbwI2Z
 MsrCl2rEZcGpgp4oQskEB6Na3vxdvrwn3moMI1Tqdx8i0k/D4/LyhO2ag8r7VxUahc949mkDJquwB
 PlPlMuOY0pSnX1chryhvlswJbpfavScXNVA+fSOUwLtVucojqetSExubjetAwAvzB6+R/uPe0NzKT
 CX6rHCLOhuqyO9/LepNt/MPLDyRx0DfUWBTaAh1LBQvRVgDDawyG/rkkYSAr1925loBnh4iI0nwjD
 ihYpmKy80qUbiJLAmGbquPRXiqt5ENPKXogauFPOdNr3EOhFOpKeTfB+r9xriqUPuU8DbHSI+NS3e
 iMiczJczch6PS+tkWUWXPv7dnwlqS0sIDbj/5Drh5ZlW01a2GZk+qyz0ybluG15gQL8wzGJoR76KK
 ssTVJUN/3oVRtOUN6JnUWPXfBRtNOwx7TyeFUGVqAi2lZQFQP/YEiXKAu5qRQaxtANK2ydSfjkzHQ
 IldbXPFVDNbE4j0wUh2bZ8Mf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vg2K6-000000007D8-0bN1; Wed, 14 Jan 2026 14:58:14 +0000
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
Subject: Negative connection cache (Was: [SCM] Samba Shared Repository -
 branch master updated)
Date: Wed, 14 Jan 2026 15:58:13 +0100
Message-ID: <2910646.DJkKcVGEfx@magrathea>
In-Reply-To: <b3f3e906-1718-4719-abe6-7bb1858ad607@samba.org>
References: <E1vfhlN-00ALwd-Np@hrx0.samba.org>
 <b3f3e906-1718-4719-abe6-7bb1858ad607@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 14 January 2026 09:01:49 Central European Standard Time Stefan 
Metzmacher wrote:
> Hi Andreas,

Hi Metze,

> > diff --git a/source3/libads/kerberos.c b/source3/libads/kerberos.c
> > index 5593364c397..ed8d52f7866 100644
> > --- a/source3/libads/kerberos.c
> > +++ b/source3/libads/kerberos.c
> > @@ -1259,10 +1259,10 @@ static char *get_kdc_ip_string(char *mem_ctx,
> > 
> >   		cldap_reply = &responses[i]->data.nt5_ex;
> >   		
> >   		if (cldap_reply->pdc_dns_name != NULL) {
> > 
> > -			status = check_negative_conn_cache(
> > +			bool has_entry = has_negative_conn_cache_entry(
> > 
> >   				realm,
> >   				cldap_reply->pdc_dns_name);
> > 
> > -			if (!NT_STATUS_IS_OK(status)) {
> > +			if (has_entry) {
> > 
> >   				/* propagate blacklisting from name to ip */
> >   				add_failed_connection_entry(realm, 
addr,add_failed_connection_entry( status);
> >   				continue;
> 
> This looks strange, what is 'status' at this point?
> It used to be the status stored in the name based record.
> 
> I'm wondering about the motivation about this patch,
> my first reaction was: this is not simpler now.

In libads/ldap.c we set it to NT_STATUS_UNSUCCESSFUL in case for the IP 
address. We could just do the same here.

If you have a function check_negative_cache_conn and it return NT_STATUS_OK 
and reports that in the log. What does it mean than. That the connection is in 
the negative connection cache or not.
Nobody understands the log message without knowing the code.

Also in 99% of the cases we do not care about the result returned. The issue 
you showed is the only time we use the return value to hand it to 
add_failed_connection_entry().



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



