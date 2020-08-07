Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F623ED33
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 14:17:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=NoCS6GF+SKZbxxScvagjlHB7/2jxSo1PgUTc5Y6yaP0=; b=acLYzPAxdKz5ucrDp2FjF+V+Fk
	jlV4aKG+IxsMrlSM/atP8SGrPbwdfqH8LLyf57BKYCa3+/1Iu+SIEiHgCbdCcBOj0O9ZnGZi8VxDv
	iTH4xk5l972pMUb/EzKHeuYY2X24LXQPAMMzJxzPPZLnVnmMOGYUdzpTE2QnZ5Cun+rsTYNFrHFKV
	lZe4dPSx9h1Ggfm8I85+l8+Ut0Dx84SvtkMGKsO8qKXw9o3y7uyf20qQ7anLMgtdZHirD8SityCMG
	f8tcc1Pu3Z0D6wdG9reDttB+UL2krLh41Ap9nA7xw5uPvvPwh8PemK7pInk7Aw4e5ov33sMXVBp3Z
	AUEFTQfg==;
Received: from localhost ([::1]:51772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k41JE-00ClYD-N6; Fri, 07 Aug 2020 12:17:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k41J7-00ClY6-Uq
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 12:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=NoCS6GF+SKZbxxScvagjlHB7/2jxSo1PgUTc5Y6yaP0=; b=DGZtj5OFMmoRjjEPOotRrcJfHy
 BsaN1idAHfSAH+h1YnhN0BCoiKgwulTRE6OkymO3utksjVYkmOWmldz4IR946LLDVzLhWcLF0Qgmy
 y8wz1uQ2NmTBnCxS9IAZOp39iPJnmh13p+MqZFlzSfDSFtliGiZZzfkn7Tt5K2f8g/ghCDuP2fVA5
 XQvOmByQlZBW5u6LA4ytNjScA2TP3f6hbgIL8OeIRhsfdaESSz65ZJbShQ0sKS3nzbYstrCmOzLIM
 4G1IFIMjgg/93yLBK/EwT5MZQRKhM9yFOofGD7uHohrPY2rMZ78fiL0aPEXt/pG2RHsCXCIHeZPhy
 VQ+VxCC6DveZAWnqLgDQLoYjqyRL6oOcYmOOJSOVpvzi0v/dfORqw+Zsd9hCIZEdr1du4nFmt/6/5
 RZSZz43U2bBaY5e2emltkH33bUQjOcRmuNjFNe72eHpsp/j9LVFo5H8g6BILkncCDk/1cZMfcTSBU
 xM0y8U7huHGcD5QvO0FgOmT5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k41J7-0004lP-Kd
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 12:17:09 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: The way to using s4u2self in winbindd
Message-ID: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
Date: Fri, 7 Aug 2020 14:17:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="MlD9CBz21Y5rB2LTqL2QQmhvxEwYblqUd"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MlD9CBz21Y5rB2LTqL2QQmhvxEwYblqUd
Content-Type: multipart/mixed; boundary="4JpnhgxqSjCYV0AqmT8CL9Lwicoho4uQs";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <b643061e-177f-727a-542f-54ed3c1c358f@samba.org>
Subject: The way to using s4u2self in winbindd

--4JpnhgxqSjCYV0AqmT8CL9Lwicoho4uQs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

This is an overview over the remaining tasks to make of of S4U2self
in Samba's winbindd, which would work also via domain trusts.

Given the recent discussion regarding our LDAP libraries, I'd like to
get some feedback regarding my roadmap. No promises that I'll work on
these items in near future, but it would be good to get NACKs as early
as possible.

As the work in the last month revealed that there're quite some
missing features around S4U2Self in existing Kerberos libraries
(Samba's (lorikeet-)Heimdal, Upstream Heimdal and Upstream MIT Kerberos)
and it's harder than expected to fill the missing gaps, this proposes
to start with the feature set that currently exists and prepare the
infrastructure in Samba first. From there the remaining parts can
be added as required.

Overview:

[Task#01] Prepare the existing work in progress patches for upstream Samb=
a
[Task#02] Rebase Samba's (lorikeet-)Heimdal with Upstream
[Task#03] Add S4U2Self protocol tests
[Task#04] Disable transited checking in gss_accept_sec_context()
[Task#05] Implementing the missing S4U2Self features in upstream MIT
[Task#06] Implementing the missing S4U2Self features in upstream Heimdal

Details:

[Task#01] Prepare the existing work in progress patches for upstream Samb=
a
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-s4u2self

=46rom that branch the following parts are relevant here:

- The cli_credentials apis for ccache/keytab handling should be moved fro=
m
  functions, which operate on krb5_/gss_ malloc'ed objects, like:
  - cli_credentials_get_ccache
  - cli_credentials_get_named_ccache
  - cli_credentials_get_client_gss_creds
  - cli_credentials_get_keytab
  - cli_credentials_get_server_gss_creds
  into these functions, which only store the string names instead
  of doing wild talloc magic to get the ref counting correct:
  - cli_credentials_krb5_get_ccache_name
  - cli_credentials_krb5_get_keytab_name

  An important point is that the new function will never
  trigger any implicit network operations as side effect.
  We no longer pass in any tevent_context pointer, which
  would trigger nested event loops.

- The cli_credentials_add_dict() infrastructure in order to
  safely attach named (and typed) talloc pointers to cli_credentials,
  on talloc free they are automatically removed in order to avoid
  the risk of stale pointers. Note this does not use talloc_reference!

- This existing cli_credentials apis for S4U2Self should be converted to:=


  NTSTATUS cli_credentials_s4u_upn_creds(TALLOC_CTX *mem_ctx,
                                         struct cli_credentials *service_=
cred,
                                         const char *service_spn,
                                         const char *user_upn,
                                         struct cli_credentials **_s4u_us=
er_cred);

  NTSTATUS cli_credentials_s4u_service_cred(
                         struct cli_credentials *user_cred,
                         struct cli_credentials **_service_cred,
                         const char **_service_spn);

- cli_credentials_krb5_refresh_ccache[_{send,recv}] will be the
  central location where we do interaction with the KDC in order
  to get a valid krb5_ccache for the given cli_credentials.
  This initial code might operate completely blocking, but
  still provide _send/recv functions in order to prepare
  the gensec module for async interaction.

  Internally this hides the magic to check for valid tickets
  in the krb5_ccache and decides when it needs to use
  cli_credentials_kinit_ccache_send/recv() with smb_krb5_kinit_send/recv(=
)
  as well as smb_krb5_s4u2self_send/recv() for cli_credentials_s4u_upn_cr=
eds()
  creds.

  This makes everything transparent for the gensec modules, they
  only need to call cli_credentials_krb5_refresh_ccache_send/recv
  with the given cli_credentials.

- gssapi_client_krb5_creds[_{send,recv}] will be the central location whe=
re we do
  interaction with the KDC in order to get valid service tickets into the=

  given ccache, if they're missing.

  This makes everything transparent for the gensec modules, they
  only need to call gssapi_client_krb5_creds_send/recv() passing the
  ccache name from cli_credentials_krb5_get_ccache_name() of
  with the given cli_credentials.

  gssapi_client_krb5_creds_recv() returns everything that's required
  to call gss_init_sec_context(), without letting it block (at least
  in theory). For the initial implementation we'll have to
  take what we can get from existing MIT/Heimdal libraries, so
  may still block.

  Internally this hides using S4U2proxy if a service_ccache_name is provi=
ded,
  which is taken by calling cli_credentials_krb5_get_ccache_name()
  and the service_creds returned from cli_credentials_s4u_service_cred().=


- source4/auth/gensec/gensec_gssapi.c and source3/librpc/crypto/gse.c
  both implement GSS-KRB5 backend for gensec. They already share
  some common code. By consistently using cli_credential structures
  for client, but also server, we're able to remove
  source3/librpc/crypto/gse.c and have just one backend that
  we need to modify in order to add s4u2self support, by using
  cli_credentials_s4u_service_cred() and gssapi_client_krb5_creds_send/re=
cv().
  It also means we need to remove all usage of exporting
  an KRB5CCNAME environment variable. We need to pass things explicit
  by using cli_credentials.

- At least we need the stubs for the 'struct smb_krb5_network'
  infrastructure for smb_krb5_network_transaction[_{send/recv}]().

- smb_krb5_kinit_login[_{send,recv}] will be used to glue everything
  together in winbindd.

  Internally is does the gensec_update() dance for client and server cred=
s
  in order to extract the PAC_LOGON_INFO from the service ticket.

  winbindd basically used machine_creds in order to use
  cli_credentials_s4u_upn_creds() to get s4u_user_creds
  and then passes s4u_user_creds and machine_creds to
  smb_krb5_kinit_login().

  smb_krb5_kinit_login() can also be used for the pam_winbind use
  of kerberos, but that's not strictly required, if it may make
  it easier to get the smb_krb5_kinit_login() code path tested.

- While smb_krb5_kinit_send/recv() should use krb5_init_creds_step() via
  smb_krb5_init_creds_get_send/recv(), we could start with a blocking
  implementation that tries to get the best out of existing kerberos libr=
aries.

- While smb_krb5_s4u2self_send/recv() as well as
  gssapi_client_krb5_creds_send/recv() should use krb5_tkt_creds_step()
  via smb_krb5_tkt_creds_get_send/recv(), we could start with a blocking
  implementation that tries to get the best out of existing kerberos libr=
aries.

- In order to work without smb_krb5_{init,tkt}_creds_get_send/recv() supp=
ort
  we'll avoid any nested event loops via the send_to_kdc hooks.
  The only real application that's affected by this is the
  AD replication client "drepl" task. But as this will most likely
  only talk to the local KDC task, there shouldn't be problems
  as long as we sanely handle timeouts.

- Finally we need to use winbind_S4U2Self_SamInfo6(), which uses
  cli_credentials_s4u_upn_creds() together with smb_krb5_kinit_login().
  This may return NT_STATUS_NO_S4U_PROT_SUPPORT in order trigger
  a fallback in the caller.

  wb_gettoken_send/recv will start with wb_lookupsid_send/recv
  in order to get the NT4 Domain and Account names for the
  sid. These will be used to form an enterprise principal
  that is passed to winbind_S4U2Self_SamInfo6().

  For now we should have an smb.conf option (maybe "winbind use s4u2self"=
)
  which in turned off by default ntil we're sure we have complete s4u2sel=
f
  support in the kerberos libraries (maybe in future).

[Task#02] Rebase Samba's (lorikeet-)Heimdal with Upstream
https://gitlab.com/samba-team/devel/lorikeet-heimdal/-/commits/lorikeet-h=
eimdal/
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-heimdal
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-krb5-testing

The last rebase/import of Heimdal into Samba is from July 2011.

In the meantime upstream Heimdal changed quite a bit
and it's no longer trivial to port changes between them.

In order to avoid the overhead of implementing the features
needed for full S4U2Self support, we better deal with just
2 implementations (upstream Heimdal and upstream MIT).
So doing a fresh import what be a good thing.

So far there are a few challenges, which prevented further
imports in the past:
- Samba's AD server testing relies on (and only exist of)
  only a few smbtorture tests, which rely on the internal behavior
  of Samba's Heimdal copy using the send_to_kdc hooks.

  Heimdal's internals have changed in the meantime
  and it's not trivial to adopt the torture tests
  to the new. Given the little coverage these tests
  have it's even more wasted time.
- Importing new KDC code (with hidden behavior changes)
  always brings the risk of breaking the AD DC case
  with Windows clients (and other external clients).

Recently Samba got a new framework for testing
kerberos using python's pyasn1 and some crypto libraries.
This enabled very exact tests for almost every
bit in the protocol. The 'master-krb5-testing' branch
already contains replacements for some of the smbtorture
tests. These tests are developed against Windows KDCs
and they reveal exactly the differences between Windows,
Heimdal and MIT KDCs.

Spending time on these new tests removes the
blockers in two ways:
- We no longer rely on send_to_kdc internals
- We have more confidence to avoid hidden regressions
  by updating the new KDC code.

[Task#03] Add S4U2Self protocol tests

Given the new pyasn1 based kerberos testing infrastructure,
we should develop tests, which are able to talk to multiple
trusted domains. These tests should be able to decrypt
all packets in the complex request chain to get an
S4USelf ticket via trusted domain boundaries.
It also needs to work out the behavior differences
between the old PA_FOR_USER and the new PA_FOR_X509_USER
versions of S4U2Self. The interaction with enterprise principals
is also a very important aspect to test.

Together with a bit of research how Windows clients do
S4U2Self, we should have enough information in order to
implement the missing C code in the upstream Heimdal and
MIT libraries.

Windows 2012 and higher have an "Attempt S4U2Self o optain claim
information" setting, maybe that can be used together with NTLMSSP
to trigger S4U2Self from Windows.

[Task#04] Disable transited checking in gss_accept_sec_context()
https://github.com/krb5/krb5/pull/1005
https://github.com/heimdal/heimdal/pull/656

When dealing with trusted active directory domains,
it's currently needed that the user of gss_accept_sec_context(),
which would also be used for S4U2Self in winbindd (via gensec_gssapi.c),
would have the full trust topology defines in the [capaths] section
of the used krb5.conf, because Windows KDCs don't set the
transited-policy-checked flag, while they already checked
policies and verified the ticket can be trusted.
Also domain members servers in active directory are not
supposed to know the topology, they should just trust
the KDC of the primary domain.
In order to accept kerberos authentication from trusted domain
via S4U2Self (but also any other protocol), we need a way to
disable the check in gss_accept_sec_context()

The referenced pull requests for upstream MIT and Heimdal,
contain working patches, which already come with testcases.

But as these patches instrument the legacy gss_set_cred_option()
call for the acceptor credentials passed to gss_accept_sec_context(),
the changes are rejected for upstream inclusion to Heimdal.

There's no agreed solution available for what to use
instead of gss_set_cred_option().

We should have the same interface for both Heimdal and MIT
in order to avoid #ifdef's in Samba.

There is most likely quite some time required to
resolve the discussion.

[Task#05] Implementing the missing S4U2Self features in upstream MIT
https://github.com/krb5/krb5/pull/1014 (stepwise S4U interface)
https://github.com/krb5/krb5/pull/1005 (NO_TRANSIT_CHECK)

As outlined before Samba wants to use the krb5_{init,tkt}_creds_step()
APIs, but in MIT (up to krb5-1.18) S4U2Self is not supported via
these APIs. PR 1014 already has some of this implemented,
but we should better wait for the outcome of the S4U2Self protocol tests
in order to judge if this is feature complete and does everything
Samba requires. It be very bad if we would need to handle even more
combinations of half implemented features in Samba.

[Task#06] Implementing the missing S4U2Self features in upstream Heimdal
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-s4u2self

As outlined before Samba wants to use the krb5_{init,tkt}_creds_step()
APIs, but they are only implemented partly and not a public interface
of libkrb5.so.

The Samba branch has a work in progress implementation for them.
But similar to the existing Heimdal APIs, they support S4U2Self
only for the local realm of the service and only with the legacy
PA_FOR_USER version of S4U2Self.

Adding cross-realm S4U2Self support is not trivial and requires
the result of the S4U2Self protocol tests and research findings.

It's expected to be easier to only implement this for the
upstream Heimdal version and wait for Heimdal import into Samba,
instead of wasting time to also implement this in the old Samba
Heimdal copy.


Thanks!
metze


--4JpnhgxqSjCYV0AqmT8CL9Lwicoho4uQs--

--MlD9CBz21Y5rB2LTqL2QQmhvxEwYblqUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8tRkAACgkQDbX1YShp
vVaZKQ//UK7l4T8Xmxp6Hu3AFKbWzVEH4zTwY653xyxkQZWRRTk1Jab+4IuoexQ9
atmXAUU11nHUbCkLEyzXvoMpOzwtclQX7kgTncGQEoFupxDe0gC49DpkUXEdf2yv
YjnRNZwT0NP76KYgbuE33aeQ1ffL0UDsiDqAW04O/vjY3OS81oIc9it7ZZlTUo0A
PsPLl6CQHii5Sw0offeaf4AnJSg2DO6WEAottuQtjqT6jhogpEIr1wml/LXCW4UQ
3Y1IFMOcC4GMykmZUurm9k4WUaz+hWSa5ILl2peAX39IIrCUQd3Py+q+yh1bW7lj
mqre8wq6YqLbcFapeSz7ORtiMJGDdNd+j16rCqaYjEVeyrxfdYgxr0sDLeEGFsRj
rnzYUH2SQVz27CwWg1gLDCgzhIY1qlR7mLBO0KWttfP0g7ESbIas3Q8FhSQEhntL
sy9glSxEl1AXbhFoCegiVcNobzEVN0IVPHyUYTsUCfY6tyO30EyJj6hQLTFKP0Z5
gm0uJKj7hjpqkytL9Z1e44xV89tuKMEd8wf/YjwLKi1jUq/U0AD4PKMtoWfSGRp5
HHO9FO+/M6R9t1clf8KZL93EvdQ/2AwrLAU9L1xM8svVKJbU+YG0zcSR6pAKPB6o
SdvL3bQNPozi+ko+lXfSp02lYlDXT4MQidsew1xSjibhMDVZcAw=
=LMey
-----END PGP SIGNATURE-----

--MlD9CBz21Y5rB2LTqL2QQmhvxEwYblqUd--

