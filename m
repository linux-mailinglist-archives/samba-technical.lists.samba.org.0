Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D822A25A
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 00:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=15K9XDHVcpT/SJSXYYaJh7yegfehbtNMxr3SiRI4W/k=; b=3FqRFP6NG//CMyBtK3ptreONQS
	HVXPc5hz0QZQAKmDXPru5jL/35LRXgsTD6pLubvnpdpk1q86VBJwMqFC9iHnXQiL4rFjNR0uBWMWn
	7Nb1Cn/JMmvKaia+RmjXmWWQ9nkWgK0hlmXaNv6VuIvxVaMZQPP/d1QJnzHOhhipHBGfEspMllYFO
	WXIgQSPGl3nsn16jZ3KbgytjPcASHlvgBtQvudDbBVuqBDqBgAjCFPePqa/oKP08RzEOJDuJNp9Cq
	hB2+nid9afBLUmu+DjS93klmuM800Pda/ByH0jSxKE2qVPQqi/zF8pgzZlCaf35QHlavqZmc3GYHD
	VUsqe5GQ==;
Received: from localhost ([::1]:63180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyNFP-009GOJ-Ez; Wed, 22 Jul 2020 22:29:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyNFJ-009GOC-3x
 for samba-technical@lists.samba.org; Wed, 22 Jul 2020 22:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=15K9XDHVcpT/SJSXYYaJh7yegfehbtNMxr3SiRI4W/k=; b=gnPyj+NobEn8QvgS7ucpA4xu0Y
 /VfDkPtSWN1dz0PsK3gOVvNSPVF/khkkXNC9+rbeUabHErlo7TE3K6cNjf0+5eErGnSSXG/6KWzsf
 TVqUz9Nj5CPqs3C50+tzHq9nqu82b2l78KX9Do3+X/XN7pVdltEJdO4SMO95N34PJ/HE2lN0p7qGU
 xPzrlVaRZLhZRcrKvZkWc6h+QnI6sWoqx2B0BauMQPJs6bb8f+pGjc+ON4szJciVqkfYkBf865Ni3
 l98hmsbU+r/RQGHDx6ALUI5HClBlink+rHLKWDhoxF4vRpjbpm5e45vIF/JtzWJSP3d9phKd8IK7S
 VXYIIZ5Q3cd2/Dg4cihecJk11Y3P9hOBmW0c+YRseRl65L7smy05RJGTKs18ykpuhoCQTuQda/97b
 BfLKFXxrh/U1gS2rVLY1uEqs/KseylAvil/+CsMbhvwUi8kjTl9+oO/1AF7rKJCJ7ZaR5jc9EMekc
 b+v+1BzMbKmWmdgR7dFp69ZS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyNFF-0004wV-LN; Wed, 22 Jul 2020 22:29:50 +0000
Date: Wed, 22 Jul 2020 15:29:45 -0700
To: metze@samba.org, slow@samba.org, Andrew Bartlett <abartlet@samba.org>,
 Samuel Cabrero <scabrero@samba.org>, samba-technical@lists.samba.org
Subject: Massively excessive DNS lookups in ads_XXXX code.
Message-ID: <20200722222945.GA3385@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

Inside ADS_STRUCT we have:

        struct {
                char *realm;
                char *workgroup;
                char *ldap_server;
                bool gc;     /* Is this a global catalog server? */
                bool no_fallback; /* Bail if the ldap_server is not availab=
le */
        } server;

and also:

        /* info derived from the servers config */
        struct {
                uint32_t flags; /* cldap flags identifying the services. */
                char *realm;
                char *bind_path;
                char *ldap_server_name;
                char *server_site_name;
                char *client_site_name;
                time_t current_time;
                char *schema_path;
                char *config_path;
                int ldap_page_size;
        } config;

Inside server we have:

	server.ldap_server

which I'm assuming is the DNS name of
the server we should be talking to.

But we *also* have:

	config.ldap_server_name

which I'm assuming is the DNS name
of the LDAP server we're told to use
by a configuration parameter.

When we're looking for DC's we get
a list of possible DC IP addresses
and then do:

cldap_ping_list()
	which calls ads_try_connect()

for all the IP addresses we found in
turn.

Inside ads_try_connect() we call

ads_cldap_netlogon_5()

and if it's successful (i.e. it
passes muster as a DC we should
be talking to) then in ads_try_connect we do:

 292         /* Fill in the ads->config values */
 293
 294         SAFE_FREE(ads->config.realm);
 295         SAFE_FREE(ads->config.bind_path);
 296         SAFE_FREE(ads->config.ldap_server_name);
 297         SAFE_FREE(ads->config.server_site_name);
 298         SAFE_FREE(ads->config.client_site_name);
 299         SAFE_FREE(ads->server.workgroup);

=2E..

307         ads->config.ldap_server_name   =3D SMB_STRDUP(cldap_reply.pdc_d=
ns_name);
308         ads->config.realm              =3D SMB_STRDUP(cldap_reply.dns_d=
omain);

=2E..
323         ads->server.workgroup          =3D SMB_STRDUP(cldap_reply.domai=
n_name);
324
325         ads->ldap.port =3D gc ? LDAP_GC_PORT : LDAP_PORT;
326         ads->ldap.ss =3D *ss;

Note how we've carefully set the values of

ads->config.ldap_server_name
ads->ldap.port
ads->ldap.ss

=66rom the CLDAP ping - *everything* we need to
then do an immediate successful connect to
the server that retuned the CLDAP ping.

But note - we *NEVER* set the value of

ads->server.ldap_server.

This is unfortunate, as what it means is ads->server.ldap_server
is left as NULL even after a successful CLDAP ping.

Problem is, ads->server.ldap_server is the value
that is checked inside:

ads_connect()

which is what finally does (another) DNS -> IP
lookup and tries to connect.

Inside ads_connect() we have:

612         if (ads->server.ldap_server) {
613                 bool ok =3D false;
614                 struct sockaddr_storage ss;
615
616                 ok =3D resolve_name(ads->server.ldap_server, &ss, 0x20,=
 true);
617                 if (!ok) {
618                         DEBUG(5,("ads_connect: unable to resolve name %=
s\n",
619                                  ads->server.ldap_server));
620                         status =3D ADS_ERROR_NT(NT_STATUS_NOT_FOUND);
621                         goto out;
622                 }
623                 ok =3D ads_try_connect(ads, ads->server.gc, &ss);

=2E...

(another note - checking carefully ads->server.gc
is *never* set to true anywhere, so I think we
can remove it and remove this bool parameter
to ads_try_connect()).

Note we don't first check if we already have
a perfectly good ads->ldap.ss field and have
already looked up the ads->server.ldap_server -> ads->ldap.ss
but ignore it and do it again.

If you look carefully, the *only* place

ads->server.ldap_server

is *actually* set is in source3/libads/ads_struct.c:

130 /*
131   initialise a ADS_STRUCT, ready for some ads_ ops
132 */
133 ADS_STRUCT *ads_init(const char *realm,
134                      const char *workgroup,
135                      const char *ldap_server,
136                      enum ads_sasl_state_e sasl_state)
137 {
138         ADS_STRUCT *ads;
139         int wrap_flags;
140
141         ads =3D SMB_XMALLOC_P(ADS_STRUCT);
142         ZERO_STRUCTP(ads);
143
144         ads->server.realm =3D realm? SMB_STRDUP(realm) : NULL;
145         ads->server.workgroup =3D workgroup ? SMB_STRDUP(workgroup) : N=
ULL;
146         ads->server.ldap_server =3D ldap_server? SMB_STRDUP(ldap_server=
) : NULL;

=2E..

So what this means is after the CLDAP ping,
ads->server.ldap_server =3D=3D NULL

and inside ads_connect(), because ads->server.ldap_server =3D=3D NULL
we call:

643         ntstatus =3D ads_find_dc(ads);
644         if (NT_STATUS_IS_OK(ntstatus)) {
645                 goto got_connection;
646         }
647
648         status =3D ADS_ERROR_NT(ntstatus);
649         goto out;
650
651 got_connection:
652
653         print_sockaddr(addr, sizeof(addr), &ads->ldap.ss);
654         DEBUG(3,("Successfully contacted LDAP server %s\n", addr));

which does *ANOTHER* round of SRV -> server name -> DNS
lookups. This is *REALLY* expensive !!!!!!

We *finally* end up in ads_connect():

688         /* Otherwise setup the TCP LDAP session */
689
690         ads->ldap.ld =3D ldap_open_with_timeout(ads->config.ldap_server=
_name,
691                                               &ads->ldap.ss,
692                                               ads->ldap.port, lp_ldap_t=
imeout());
693         if (ads->ldap.ld =3D=3D NULL) {
694                 status =3D ADS_ERROR(LDAP_OPERATIONS_ERROR);
695                 goto out;
696         }
697         DEBUG(3,("Connected to LDAP server %s\n", ads->config.ldap_serv=
er_name));

Hurrah - we've finally connected...

We've gotten away with this working, as most DNS
setups are sane and work quickly.

However I'm working on an issue where the DNS
is broken, and takes *far* too long to perform
these multi-lookups.

Correct me if I'm wrong - but what we need to
do here is:

(a). Remove ads->server.gc and remove the 'bool gc'
parameter from ads_try_connect().

(b). Inside ads_try_connect() add the lines:

diff --git a/source3/libads/ldap.c b/source3/libads/ldap.c
index d431156912f..1b969b75371 100755
--- a/source3/libads/ldap.c
+++ b/source3/libads/ldap.c
@@ -297,6 +297,7 @@ static bool ads_try_connect(ADS_STRUCT *ads, bool gc,
        SAFE_FREE(ads->config.server_site_name);
        SAFE_FREE(ads->config.client_site_name);
        SAFE_FREE(ads->server.workgroup);
+       SAFE_FREE(ads->server.ldap_server);
=20
        if (!check_cldap_reply_required_flags(cldap_reply.server_type,
                                              ads->config.flags)) {
@@ -321,6 +322,7 @@ static bool ads_try_connect(ADS_STRUCT *ads, bool gc,
                        SMB_STRDUP(cldap_reply.client_site);
        }
        ads->server.workgroup          =3D SMB_STRDUP(cldap_reply.domain_na=
me);
+       ads->server.ldap_server =3D SMB_STRDUP(cldap_reply.pdc_dns_name);

(c). Inside ads_connect() add the lines:

@@ -609,6 +611,14 @@ ADS_STATUS ads_connect(ADS_STRUCT *ads)
                TALLOC_FREE(s);
        }
=20
+       if (!is_zero_addr(&ads->ldap.ss)) {
+               /* We already know who to talk to. */
+               book ok =3D ads_try_connect(ads, &ads->ldap.ss);
+               if (ok) {
+                       goto got_connection;
+               }
+       }
+
        if (ads->server.ldap_server) {
                bool ok =3D false;
                struct sockaddr_storage ss;

Do you concur ?

I think doing this will lead to an *ORDER OF MAGNITUDE*
speedup in ads_XXXXX() connections (used by winbindd
as well as the 'net' tools) in flaky DNS situations ?

I'm going to test this in CI and on the customer site,
but I just wanted other eyes to look at this to make
sure my analysis was correct.

Cheers,

Jeremy.

